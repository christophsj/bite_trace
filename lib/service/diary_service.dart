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

  final Map<String, Map<DateTime, bool>> _inDb = {};

  bool inDb(String userId, DateTime dateTime) {
    return _inDb[userId]?[dateTime.atMidday()] ?? true;
  }

  void setInDb(String userId, DateTime dateTime, bool inDb) {
    if (_inDb[userId] == null) {
      _inDb[userId] = {};
    }
    _inDb[userId]![dateTime.atMidday()] = inDb;
  }

  Future<String> getUserId() async {
    final auth = ref.read(authServiceProvider);
    final friend = ref.read(selectedFriendProvider);

    if (friend != null) {
      return friend;
    } else {
      final user = await auth.getCurrentUser();
      if (user == null) {
        throw Exception('User is null');
      }
      return user.userId;
    }
  }

  Future<DiaryEntry> getLog(
    DateTime date, {
    bool tryFromCache = true,
    String? uid,
  }) async {
    final key = date;
    final userId = uid ?? await getUserId();
    if (!tryFromCache || state.getEntry(userId, key) == null) {
      return _getLog(userId, key);
    }

    return state.getEntry(userId, date)!.entry!;
  }

  Future<DiaryEntry> _getLog(String userId, DateTime date) async {
    state.setEntry(userId, date, const DiaryEntryState());
    DiaryEntry? log = await _queryLogFromDb(date);
    if (log == null) {
      final acc = (await ref.read(accountServiceProvider).getAccount(userId))!;
      // does not exist -> empty log
      log = _setDefaultMeals(
        DiaryEntry(
          day: TemporalDate(date),
          id: userId,
          goals: acc.nutrientGoals,
        ),
        acc,
      );
      setInDb(userId, date, false);
    } else {
      setInDb(userId, date, true);
    }

    _updateState(log);
    return log;
  }

  Future<List<Food>> getRecentFoods({
    required String filter,
    int page = 0,
    int limitDays = 14,
  }) async {
    final userId = await getUserId();

    final entries = await Amplify.DataStore.query<DiaryEntry>(
      DiaryEntry.classType,
      where: DiaryEntry.ID.eq(userId),
      sortBy: [DiaryEntry.DAY.descending()],
      pagination: QueryPagination(page: page, limit: limitDays),
    );

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

    return foods;
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
      await Amplify.DataStore.save(log);
      _updateState(log);
    } on DataStoreException catch (e) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Error updating model: "${e.message}"');
      safePrint('Something went wrong updating model: ${e.message}');
    }
  }

  Future<void> updateTodaysGoals(NutrientGoals x) async {
    final today = DateTime.now().atMidday();
    final uid = await getUserId();
    final entry = state.getEntry(uid, today);
    if (entry != null && entry.entry != null) {
      state = state.copyWithEntry(
        userId: uid,
        dateTime: today,
        entry: entry.copyWith(
          entry: entry.entry!.copyWith(goals: x),
        ),
      );
      Amplify.DataStore.save(entry.entry!);
    }
  }
}
