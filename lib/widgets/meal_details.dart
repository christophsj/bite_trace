import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/food_entry.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealDetails extends ConsumerWidget {
  MealDetails({
    required this.log,
    super.key,
    this.actions = const [],
    required this.onFoodDelete,
    required this.onTapFood,
    required this.name,
    required this.foods,
    this.children = const [],
  });

  final DiaryEntry log;
  final List<Widget> actions;
  final void Function(int) onFoodDelete;
  final void Function(Food, int) onTapFood;
  final String name;
  final List<Food> foods;
  final List<Widget> children;

  final TextEditingController amount = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final n = NutrientsExtension.combine(
      foods.map((e) {
        return e.nutritionalContents.servingFactor(
          e.servingFactor,
        );
      }).toList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: actions,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: MacrosDisplay(
                    nutrients: n,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Column(
                  children: [
                    for (final food in foods.asMap().entries)
                      FoodEntry(
                        food.value,
                        onTapTrailing: () => onFoodDelete(food.key),
                        onTap: () => onTapFood(food.value, food.key),
                      ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ...children,
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
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
