import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/models/MyMeal.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/widgets/food_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage<MyMeal>()
class MyFoodDetailsScreen extends ConsumerWidget {
  const MyFoodDetailsScreen({
    required this.foodIdx,
    required this.meal,
    super.key,
  });

  final int foodIdx;
  final MyMeal meal;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FoodDetails(
      food: meal.foods[foodIdx],
      meals: [meal.name],
      foodIdx: foodIdx,
      onSubmit: (i, j, s) async {
        final res = await onSubmit(ref, j, s);
        ref.read(routerProvider).maybePop(res);
      },
      initialMealIndex: 0,
      icon: Icons.edit,
      label: 'EDIT',
    );
  }

  Future<MyMeal?> onSubmit(
    WidgetRef ref,
    int selectedServingIndex,
    String amount,
  ) async {
    final amt = double.tryParse(amount);
    if (amt == null) {
      ref
          .read(snackbarServiceProvider)
          .showBasic('Given servings not a number');
      return null;
    }

    meal.foods[foodIdx] = meal.foods[foodIdx].copyWith(
      chosenServingAmount: amt,
      chosenServingSize: selectedServingIndex,
    );

    await ref.read(mealServiceProvider).update(meal);
    return meal;
  }
}
