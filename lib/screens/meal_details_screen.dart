import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
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

  @override
  Widget build(BuildContext context) {
    final n = NutrientsExtension.combine(
      widget.meal.foods.map((e) => e.nutritionalContents).toList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.meal.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: widget.meal.foods.isEmpty
            ? Center(
                child: Text(
                  'nothing logged yet!'.toUpperCase(),
                  style: const TextStyle(fontSize: 18),
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MacrosDisplay(
                      nutrients: n,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MicroNutrientsDisplay(
                      nutrients: n,
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  String displayForGrams(double? item) {
    if (item == null) {
      return 'N/A';
    }
    return '${item}g';
  }
}
