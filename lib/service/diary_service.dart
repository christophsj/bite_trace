import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/state/diary_state.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/nutrient_goals_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryProvider = StateNotifierProvider<DiaryService, DiaryState>((ref) {
  final s = ref.watch(diaryServiceProvider);
  return s;
});

class DiaryService extends StateNotifier<DiaryState> {
  DiaryService({required this.ref}) : super(DiaryState());
  final Ref ref;

  Future<DiaryEntry> getLog(
    DateTime date, {
    bool tryFromCache = true,
    required String uid,
  }) async {
    final key = date;
    final userId = uid;
    if (!tryFromCache || state.getEntry(userId, key) == null) {
      return _getLog(userId, key);
    }

    return state.getEntry(userId, date)!.entry!;
  }

  Future<DiaryEntry> _getLog(String userId, DateTime date) async {
    state.setEntry(userId, date, const DiaryEntryState());
    DiaryEntry? log = await _queryLogFromDb(userId, date);
    if (log == null) {
      final acc = (await ref.read(accountServiceProvider).getAccount(userId))!;
      // does not exist -> empty log
      log = _setDefaultMeals(
        DiaryEntry(
          day: TemporalDate(date).format(),
          id: userId,
          goals: acc.nutrientGoal.getCurrentGoal(date),
        ),
        acc,
      );
    }

    _updateState(log);
    return log;
  }

  Future<(List<Food>, GraphQLRequest<PaginatedResult<DiaryEntry>>?)>
      getRecentFoods({
    required String userId,
    required String filter,
    GraphQLRequest<PaginatedResult<DiaryEntry>>? pageKey,
    int limitDays = 10,
  }) async {
    final graphQlOperation = GraphQLRequest<PaginatedResult<DiaryEntry>>(
      modelType: const PaginatedModelType(DiaryEntry.classType),
      decodePath: 'listDiaryEntries',
      variables: <String, dynamic>{
        'id': userId,
        'limit': 5,
        'nextToken': null,
      },
      document: '''
query MyQuery(\$id: ID!, \$limit: Int!, \$nextToken: String) {
  listDiaryEntries(id: \$id, limit: \$limit, sortDirection: DESC, nextToken: \$nextToken) {
    nextToken
    items {
      day
      id
      meals {
        name
        foods {
          brandName
          chosenServingAmount
          chosenServingSize
          countryCode
          description
          foodId
          imageUrl
          verified
          nutritionalContents {
            calcium
            calories
            carbohydrates
            cholesterol
            fat
            fiber
            iron
            monounsaturatedFat
            polyunsaturatedFat
            potassium
            protein
            saturatedFat
            sodium
            sugar
            transFat
            vitaminA
            vitaminB1
            vitaminB12
            vitaminB2
            vitaminB6
            vitaminB9
            vitaminC
            vitaminD
            vitaminE
            vitaminK
            vitaminPP
          }
          servingSizes {
            index
            nutritionMultiplier
            unit
            value
          }
        }
      }
    }
  }
}

''',
    );

    final request = await Amplify.API
        .query(
          request: pageKey ?? graphQlOperation,
        )
        .response;

    if (request.hasErrors) {
      ref.read(snackbarServiceProvider).showBasic(request.errors.first.message);
      throw Exception(request.errors.first.message);
    }

    final List<DiaryEntry> entries = request.data?.items
            .where((element) => element != null)
            .cast<DiaryEntry>()
            .toList() ??
        <DiaryEntry>[];

    if (entries.isEmpty) {
      return (<Food>[], null);
    }

    for (final log in entries) {
      _updateState(log);
    }

    final matchingFoods = entries
        .map((e) => e.meals!)
        .expand((e) => e)
        .map((e) => e.foods)
        .toList()
        .expand((e) => e)
        .where(
          (element) =>
              element.description.toLowerCase().contains(filter.toLowerCase()),
        );

    final ids = <String>{};
    final foods = <Food>[];
    for (final f in matchingFoods) {
      if (!ids.contains(f.foodId)) {
        ids.add(f.foodId);
        foods.add(f);
      }
    }

    final diff = DateTime.now()
        .difference(TemporalDate.fromString(entries[0].day).getDateTime());

    return (
      foods,
      diff.inDays > limitDays ? null : request.data?.requestForNextResult
    );
  }

  Future<DiaryEntry?> _queryLogFromDb(String user, DateTime date) async {
    final result = await Amplify.API
        .query(
          request: ModelQueries.get(
            DiaryEntry.classType,
            DiaryEntryModelIdentifier(
              id: user,
              day: TemporalDate(date).format(),
            ),
          ),
        )
        .response;

    return result.data;
  }

  DiaryEntry _setDefaultMeals(DiaryEntry log, AccountData data) {
    final mealNames = data.mealNames ?? Constants.defaultMealNames;
    return log.copyWith(
      meals: [
        for (int i = 0; i < mealNames.length; i++)
          Meal(name: mealNames[i], index: i, foods: []),
      ],
    );
  }

  Future<DiaryEntry> addFoodsToMeal(
    DiaryEntry log,
    Meal meal,
    List<Food> foods,
  ) async {
    try {
      _addFoods(log, meal, foods);
      await _updateOrCreate(log);
      return log;
    } on Exception catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error adding foods to meal: "$e"');
      rethrow;
    }
  }

  Future<DiaryEntry> copyMeal(
    DiaryEntry to,
    Meal toMeal,
    Meal fromMeal,
  ) async {
    return addFoodsToMeal(to, toMeal, fromMeal.foods);
  }

  Future<void> _updateState(DiaryEntry log) async {
    safePrint('Updating state at ${log.id}');
    state = state.copyWithEntry(
      userId: log.id,
      dateTime: TemporalDate.fromString(log.day).getDateTime().toLocal(),
      entry: DiaryEntryState(entry: log),
    );
  }

  Future<DiaryEntry> editFoodInMeal(
    DiaryEntry log,
    Meal meal,
    int idx, {
    Food? newFood,
  }) async {
    try {
      final meals = log.meals!;
      final mealIdxToUpdate =
          meals.indexWhere((element) => element.name == meal.name);
      if (newFood != null) {
        meals[mealIdxToUpdate].foods[idx] = newFood;
      } else {
        meals[mealIdxToUpdate].foods.removeAt(idx);
      }
      await _updateOrCreate(log);
      return log;
    } on Exception catch (e) {
      ref.read(snackbarServiceProvider).showBasic('Error editing meal: "$e"');
      rethrow;
    }
  }

  List<Meal> _addFoods(DiaryEntry log, Meal meal, List<Food> foods) {
    final meals = log.meals!;
    final mealIdxToUpdate =
        meals.indexWhere((element) => element.name == meal.name);
    if (mealIdxToUpdate < 0) {
      meals.add(meal..copyWith(index: meals.length, foods: foods));
    } else {
      meals[mealIdxToUpdate] = meal.copyWith(
        foods: List.of(meals[mealIdxToUpdate].foods)..addAll(foods),
      );
    }
    return meals;
  }

  Future<void> _updateOrCreate(DiaryEntry log) async {
    try {
      final request = ModelMutations.create(log);
      final response = await Amplify.API
          .mutate(
            request: request,
          )
          .response;
      _updateState(log);

      if (response.hasErrors) {
        throw Exception(response.errors.first.message);
      }
    } on ApiException catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error updating model: "${e.message}"');
      safePrint('Something went wrong updating model: ${e.message}');
    }
  }

  Future<void> updateTodaysGoals(String uid, NutrientGoals x) async {
    final today = DateTime.now().atMidday();
    final entry = state.getEntry(uid, today);
    if (entry != null && entry.entry != null) {
      state = state.copyWithEntry(
        userId: uid,
        dateTime: today,
        entry: entry.copyWith(
          entry: entry.entry!.copyWith(goals: x),
        ),
      );

      await Amplify.API
          .mutate(
            request: ModelMutations.update(
              entry.entry!,
            ),
          )
          .response;
    }
  }
}
