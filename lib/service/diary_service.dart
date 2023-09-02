import 'dart:async';

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

  Future<String> getUserId() async {
    final auth = ref.read(authServiceProvider);
    final user = await auth.getCurrentUser();

    if (user == null) {
      throw Exception('User is null');
    }
    return user.userId;
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
        DiaryEntry(
          day: TemporalDate(date),
          id: (await ref.read(userProvider.future))!.userId,
        ),
        ref.read(accountStateProvider).getData()!,
      );
      _inDb[date] = false;
    } else {
      _inDb[date] = true;
    }

    _updateState(log);
  }

  Future<List<Food>> getRecentFoods({
    required String filter,
    int page = 0,
    int limitDays = 10,
  }) async {
    final userId = await getUserId();

    final entries = await Amplify.DataStore.query<DiaryEntry>(
      DiaryEntry.classType,
      where: DiaryEntry.ID.eq(userId),
      sortBy: [DiaryEntry.ID.descending()],
      pagination: QueryPagination(page: page, limit: limitDays),
    );

    for (final log in entries) {
      _updateState(log);
    }

    return entries
        .map((e) => e.meals!)
        .expand((e) => e)
        .map((e) => e.foods)
        .toList()
        .expand((e) => e)
        .where(
          (element) =>
              element.description.toLowerCase().contains(filter.toLowerCase()),
        )
        .toList();
  }

  Future<DiaryEntry?> _queryLogFromDb(DateTime date) async {
    final user = await getUserId();
    final result = await Amplify.DataStore.query(
      DiaryEntry.classType,
      where: DiaryEntry.DAY.eq(TemporalDate(date)).and(DiaryEntry.ID.eq(user)),
    );

    if (result.isEmpty) {
      return null;
    }
    return result[0];
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

  Future<DiaryEntry> addFoodsToMeal(
    DiaryEntry log,
    Meal meal,
    List<Food> foods,
  ) async {
    try {
      final logWithUpdatedMeal = log.copyWith(
        meals: _addFoods(log, meal, foods),
      );
      await _updateOrCreate(logWithUpdatedMeal);
      return log;
    } on Exception catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error adding foods to meal: "$e"');
      rethrow;
    }
  }

  void _updateState(DiaryEntry log) {
    safePrint('Updating state at ${log.id}');
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
      await _updateOrCreate(log);
      return log;
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

  Future<void> _updateOrCreate(DiaryEntry log) async {
    try {
      await Amplify.DataStore.save(log);
      _updateState(log);
    } on DataStoreException catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error updating model: "${e.message}"');
      safePrint('Something went wrong updating model: ${e.message}');
    }
  }
}
