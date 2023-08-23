import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/state/diary_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryProvider = StateNotifierProvider<DiaryService, DiaryState>((ref) {
  final s = ref.watch(diaryServiceProvider);
  return s;
});

class DiaryService extends StateNotifier<DiaryState> {
  DiaryService({required this.ref}) : super(const DiaryState.initializing());
  final Ref ref;

  Future<String?> getUserId() {
    final auth = ref.read(authServiceProvider);
    return auth.getCurrentUser().then((value) => value?.userId);
  }

  Future<void> getLog(DateTime date) async {
    state = const DiaryState.initializing();
    try {
      final log = await _getLogFor(date);
      state = DiaryState.ready(log);
    } on Exception catch (e) {
      state = DiaryState.error(e.toString());
    }
  }

  Future<DiaryEntry> _getLogFor(DateTime date) async {
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

    return _createEntry(date);
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
    final request = ModelMutations.create(log);
    final response = await Amplify.API.mutate(request: request).response;

    if (response.data == null) {
      throw Exception(response.errors);
    }

    return response.data!;
  }

  Future<void> addFoodsToMeal(
    DiaryEntry log,
    Meal mealToAdd,
    List<Food> foods,
  ) async {
    state = const DiaryState.initializing();
    final meals = List.of(log.meals!);
    final idxToUpdate =
        meals.indexWhere((element) => element.name == mealToAdd.name);
    if (idxToUpdate < 0) {
      meals.add(mealToAdd..copyWith(index: meals.length, foods: foods));
    } else {
      meals[idxToUpdate] = mealToAdd.copyWith(
        foods: List.of(meals[idxToUpdate].foods)..addAll(foods),
      );
    }
    final logWithUpdatedMeal = log.copyWith(
      meals: meals,
    );

    final request = ModelMutations.update(logWithUpdatedMeal);
    final response = await Amplify.API.mutate(request: request).response;
    safePrint('Response: $response');

    if (response.data == null) {
      throw Exception(response.errors);
    }

    state = DiaryState.ready(response.data!);
  }

  // Future<void> updateFoods(DiaryEntry log, String meal, List<Food> foods) async {
  //   await diaryCollection.doc(log.id).update({
  //     'meal.$meal.foods': foods.map((e) => e.toJson()).toList(),
  //   });
  // }
}
