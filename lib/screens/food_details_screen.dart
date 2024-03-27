import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage<DiaryEntry?>()
class FoodDetailsScreen extends ConsumerWidget {
  const FoodDetailsScreen({
    required this.initialMealIndex,
    required this.log,
    required this.food,
    this.foodIdx,
    super.key,
  });

  final Food food;
  final DiaryEntry log;
  final int initialMealIndex;
  final int? foodIdx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FoodDetails(
      meals: log.meals!.map((e) => e.name).toList(),
      food: food,
      foodIdx: foodIdx,
      onSubmit: (i, j, s) => onSubmit(ref, i, j, s),
      initialMealIndex: initialMealIndex,
      icon: foodIdx == null ? Icons.add : Icons.edit,
      label: foodIdx == null ? 'LOG' : 'EDIT',
    );
  }

  Future<void> onSubmit(
    WidgetRef ref,
    int selectedMealIndex,
    int selectedServingIndex,
    String amount,
  ) async {
    final amt = double.tryParse(amount);
    if (amt == null) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Given servings not a number');
      return;
    }
    DiaryEntry? res;
    final selectedMeal = log.meals![selectedMealIndex];
    if (foodIdx == null) {
      res = await addFood(ref, selectedMeal, amt, selectedServingIndex);
    } else {
      res = await editFood(ref, selectedMeal, amt, selectedServingIndex);
    }
    if (res != null) {
      ref.read(snackbarServiceProvider).showBasic('Logged ${food.description}');
      ref.read(routerProvider).maybePop<DiaryEntry?>(res);
    }
  }

  Future<DiaryEntry?> editFood(
    WidgetRef ref,
    Meal selectedMeal,
    double amt,
    int selectedServingIndex,
  ) async {
    return ref.read(diaryServiceProvider).editFoodInMeal(
          log,
          selectedMeal,
          foodIdx!,
          newFood: food.copyWith(
            chosenServingSize: selectedServingIndex,
            chosenServingAmount: amt,
          ),
        );
  }

  Future<DiaryEntry?> addFood(
    WidgetRef ref,
    Meal selectedMeal,
    double amt,
    int selectedServingIndex,
  ) async {
    return ref.read(diaryServiceProvider).addFoodsToMeal(
      log,
      selectedMeal,
      [
        food.copyWith(
          chosenServingSize: selectedServingIndex,
          chosenServingAmount: amt,
        ),
      ],
    );
  }
}
