import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/meal_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MyMealDetailsScreen extends ConsumerWidget {
  MyMealDetailsScreen({
    required this.log,
    super.key,
    required this.meal,
    required this.selectedMealIndex,
  });

  final MyMeal meal;
  final DiaryEntry log;
  final int selectedMealIndex;

  final TextEditingController amount = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = meal.foods;
    return StatefulBuilder(
      builder: (context, setstate) {
        return MealDetails(
          log: log,
          onFoodDelete: (int f) => onRemoveFood(f, ref),
          onTapFood: (Food f, int i) async {
            final myMeal = await AutoRouter.of(context)
                .push(MyFoodDetailsRoute(foodIdx: i, meal: meal));
            if (myMeal != null) {
              setstate(() {});
            }
          },
          name: meal.name,
          foods: foods,
          children: [_logCard(ref)],
        );
      },
    );
  }

  Card _logCard(WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 70,
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    controller: amount,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: 'servings',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: AnimatedElevatedButton(
                    onPressed: () {
                      final foods = meal.foods
                          .map(
                            (e) => e.copyWith(
                              chosenServingAmount: e.chosenServingAmount *
                                  double.parse(amount.text),
                            ),
                          )
                          .toList();
                      ref.read(diaryServiceProvider).addFoodsToMeal(
                            log,
                            log.meals![selectedMealIndex],
                            foods,
                          );
                      ref.read(routerProvider).popUntil((route) {
                        return [
                          HomeRoute.name,
                          MealDetailsRoute.name,
                          FoodSearchRoute.name,
                        ].contains(route.settings.name);
                      });
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                    label: 'LOG',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onRemoveFood(int food, WidgetRef ref) async {
    meal.foods.removeAt(food);
    await ref.read(mealServiceProvider).update(
          meal,
        );
  }

  Text header(String s) {
    return Text(
      s,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }
}
