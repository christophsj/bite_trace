import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MealDetailsScreen extends ConsumerStatefulWidget {
  const MealDetailsScreen({
    required this.log,
    super.key,
    required this.meal,
  });

  final DiaryEntry log;
  final Meal meal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MealDetailsState();
}

class _MealDetailsState extends ConsumerState<MealDetailsScreen> {
  final TextEditingController amount = TextEditingController(text: '1');

  late List<Food> foods;

  @override
  void initState() {
    super.initState();
    foods = List.of(widget.meal.foods);
  }

  @override
  Widget build(BuildContext context) {
    final n = NutrientsExtension.combine(
      foods.map((e) {
        final serving = e.servingSizes[e.chosenServingSize];
        return e.nutritionalContents.servingFactor(
          serving.nutritionMultiplier * e.chosenServingAmount,
        );
      }).toList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Column(
                  children: [
                    for (final food in foods.asMap().entries)
                      FoodEntry(
                        food.value,
                        onTapTrailing: () async {
                          final diary = await ref
                              .read(diaryServiceProvider)
                              .editFoodInMeal(
                                widget.log,
                                widget.meal,
                                food.key,
                              );
                          setState(() {
                            foods = diary.meals![widget.meal.index].foods;
                          });
                        },
                        onTap: () {
                          AutoRouter.of(context).push(
                            FoodDetailsRoute(
                              initialMealIndex: widget.meal.index,
                              log: widget.log,
                              food: food.value,
                              foodIdx: food.key,
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MacrosDisplay(
                    nutrients: n,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      header('Micronutrients'),
                      MicroNutrientsDisplay(
                        nutrients: n,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text header(String s) {
    return Text(
      s,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  String displayForGrams(double? item) {
    if (item == null) {
      return 'N/A';
    }
    return '${item}g';
  }
}

class FoodEntry extends StatelessWidget {
  const FoodEntry(
    this.food, {
    super.key,
    required this.onTap,
    required this.onTapTrailing,
  });

  final Food food;
  final Function() onTap;
  final Function() onTapTrailing;

  @override
  Widget build(BuildContext context) {
    final serving = food.servingSizes[food.chosenServingSize];
    return FoodListTile(
      name: food.description,
      subtitle: '${food.chosenServingAmount}x ${serving.value} ${serving.unit}',
      color: Theme.of(context).colorScheme.secondary,
      n: food.nutritionalContents,
      onTap: onTap,
      trailingIcon: const Icon(Icons.delete),
      onTapTrailing: onTapTrailing,
    );
  }
}
