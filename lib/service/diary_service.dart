import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/state/diary_state.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryProvider = StateNotifierProvider<DiaryService, DiaryState>((ref) {
  final s = ref.watch(diaryServiceProvider);
  return s;
});

class DiaryService extends StateNotifier<DiaryState> {
  DiaryService({required this.ref}) : super(DiaryState());
  final Ref ref;

  final Map<DateTime, bool> _inDb = {};

  bool inDb(DateTime dateTime) {
    return _inDb[dateTime.atMidday()] ?? true;
  }

  void setInDb(DateTime dateTime, bool inDb) {
    _inDb[dateTime.atMidday()] = inDb;
  }

  Future<String?> getUserId() {
    final auth = ref.read(authServiceProvider);
    return auth.getCurrentUser().then((value) => value?.userId);
  }

  Future<void> getLog(DateTime date, {bool tryFromCache = true}) async {
    final key = date;
    if (!tryFromCache || state.getEntry(key) == null) {
      _getLog(key);
    }
  }

  Future<void> _getLog(DateTime date) async {
    state.setEntry(date, const DiaryEntryState());
    DiaryEntry? log = await _queryLogFromDb(date);
    if (log == null) {
      // does not exist -> empty log
      log = _setDefaultMeals(
        DiaryEntry(day: TemporalDate(date)),
        ref.read(accountStateProvider).getData()!,
      );
      _inDb[date] = false;
    } else {
      _inDb[date] = true;
    }

    _updateState(log);
  }

  // Future<List<Food?>> getRecentFoods() async {
  //   final userId = await getUserId();
  //   if (userId == null) {
  //     throw Exception('User id is null');
  //   }
  //   final request = ModelQueries.list<DiaryEntry>(
  //     DiaryEntry.classType,
  //     sort: [DiaryEntry.DAY.descending()],
  //     limit: 10,
  //   );

  //   final response = await Amplify.API.query(request: request).response;
  //   if (response.data == null) {
  //     throw Exception(response.errors);
  //   }
  //   return response.data!.items;
  // }

  Future<DiaryEntry?> _queryLogFromDb(DateTime date) async {
    final request = ModelQueries.list<DiaryEntry>(
      DiaryEntry.classType,
      where: DiaryEntry.DAY.eq(TemporalDate(date)),
    );

    final response = await Amplify.API.query(request: request).response;
    if (response.data == null) {
      throw Exception(response.errors);
    }
    if (response.data!.items.isNotEmpty) {
      if (response.data!.items[0] == null) {
        throw Exception('Item received is null: ${response.errors}');
      }
      return response.data!.items[0]!;
    }

    return null;
  }

  DiaryEntry _setDefaultMeals(DiaryEntry log, AccountData data) {
    final mealNames = data.mealNames ?? Constants.defaultMealNames;
    return log.copyWith(
      meals: [
        for (int i = 0; i < mealNames.length; i++)
          Meal(name: mealNames[i], index: i, foods: [])
      ],
    );
  }

  Future<DiaryEntry> _createEntry(DateTime date) async {
    final accountData = await ref.read(accountDataProvider.future);
    final meals = accountData?.mealNames ?? Constants.defaultMealNames;

    final mealsList = [
      for (int i = 0; i < meals.length; i++)
        Meal(name: meals[i], index: i, foods: [])
    ];
    final log = DiaryEntry(
      day: TemporalDate(date),
      meals: mealsList,
    );

    final response = await _updateOrCreate(log);

    if (response.data == null) {
      throw Exception(response.errors);
    }

    return response.data!;
  }

  Future<DiaryEntry> addFoodsToMeal(
    DiaryEntry log,
    Meal meal,
    List<Food> foods,
  ) async {
    try {
      final logWithUpdatedMeal = log.copyWith(
        meals: _addFoods(log, meal, foods),
      );
      final response = await _updateOrCreate(logWithUpdatedMeal);
      _updateState(response.data!);

      return response.data!;
    } on Exception catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error adding foods to meal: "$e"');
      rethrow;
    }
  }

  void _updateState(DiaryEntry log) {
    safePrint('Updating state at ${log.day}');
    state = state.copyWithEntry(
      dateTime: log.day.getDateTime().toLocal(),
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
      final response = await _updateOrCreate(log);
      _updateState(response.data!);
      return response.data!;
    } on Exception catch (e) {
      ref.read(snackbarServiceProvider).showBasic('Error editing meal: "$e"');
      rethrow;
    }
  }

  List<Meal> _addFoods(DiaryEntry log, Meal meal, List<Food> foods) {
    final meals = List.of(log.meals!);
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

  Future<GraphQLResponse<DiaryEntry>> _updateOrCreate(DiaryEntry log) async {
    final response =
        (inDb(log.day.getDateTime().toLocal())) ? _update(log) : _create(log);
    final result = await response;
    safePrint('Response: $result');
    if (result.data == null) {
      throw Exception(result.errors);
    }
    _updateState(result.data!);
    return response;
  }

  Future<GraphQLResponse<DiaryEntry>> _update(
    DiaryEntry log,
  ) async {
    final request = ModelMutations.update(log);
    final response = await Amplify.API.mutate(request: request).response;
    return response;
  }

  Future<GraphQLResponse<DiaryEntry>> _create(
    DiaryEntry log,
  ) async {
    final request = ModelMutations.create(log);
    final response = await Amplify.API.mutate(request: request).response;
    return response;
  }
}
