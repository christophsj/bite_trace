import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
        actions: [
          IconButton(
            onPressed: () => _openCopyMealPopup(context),
            icon: const Icon(Icons.copy),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
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
                  padding: const EdgeInsets.all(12.0),
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

  void _openCopyMealPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (c) => CopyMealDialog(
        widget.meal,
        fromTime: widget.log.day.getDateTime(),
      ),
    );
  }
}

class CopyMealDialog extends ConsumerStatefulWidget {
  const CopyMealDialog(
    this.source, {
    super.key,
    required this.fromTime,
  });

  final DateTime fromTime;
  final Meal source;

  @override
  ConsumerState<CopyMealDialog> createState() => _CopyMealDialogState();
}

class _CopyMealDialogState extends ConsumerState<CopyMealDialog> {
  late DateTime selectedDate;
  late final TextEditingController ctrl;
  late Future<DiaryEntry> selectedLog;
  Meal? selectedMeal;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    if (now.atMidday() == widget.fromTime.atMidday()) {
      selectedDate = now.add(const Duration(days: 1));
    } else {
      selectedDate = now;
    }
    ctrl = TextEditingController(text: DateFormat.yMd().format(selectedDate));
    selectedLog = ref.read(diaryServiceProvider).getLog(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('Copy meal'),
      contentPadding: const EdgeInsets.all(20),
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  // show datepicker
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 100)),
                    lastDate: DateTime.now().add(const Duration(days: 30)),
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                      selectedMeal = null;
                    });
                    ctrl.text = DateFormat.yMd().format(selectedDate);
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Date',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    controller: ctrl,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder<DiaryEntry>(
                future: selectedLog,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                  }
                  final theme = Theme.of(context);
                  return DropdownButtonFormField<Meal>(
                    value: selectedMeal,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: 'Meal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    dropdownColor: theme.brightness == Brightness.light
                        ? theme.colorScheme.primary
                        : theme.colorScheme.background,
                    items: snapshot.data!.meals!
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: theme.brightness == Brightness.light
                                    ? theme.colorScheme.onPrimary
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (v) {
                      setState(() {
                        selectedMeal = v;
                      });
                    },
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              AnimatedElevatedButton(
                onPressed: selectedMeal == null
                    ? null
                    : () async {
                        await ref.read(diaryServiceProvider).copyMeal(
                              await selectedLog,
                              selectedMeal!,
                              widget.source,
                            );
                        ref.read(routerProvider).pop();
                      },
                label: 'copy'.toUpperCase(),
              ),
            ],
          ),
        )
      ],
    );
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
