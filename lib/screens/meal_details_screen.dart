import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/diary_calendar.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MealDetailsScreen extends ConsumerWidget {
  MealDetailsScreen({
    required this.log,
    super.key,
    required this.meal,
  });

  final DiaryEntry log;
  final Meal meal;

  final TextEditingController amount = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meal = ref
        .watch(diaryProvider)
        .getEntry(log.day.getDateTime())!
        .entry!
        .meals![this.meal.index];

    final foods = meal.foods;
    final n = NutrientsExtension.combine(
      foods.map((e) {
        return e.nutritionalContents.servingFactor(
          e.servingFactor,
        );
      }).toList(),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.name),
        actions: [
          IconButton(
            onPressed: () => context.pushRoute(
              FoodSearchRoute(
                log: log,
                initialMealIndex: meal.index,
              ),
            ),
            icon: Icon(
              Icons.add,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          IconButton(
            onPressed: () => _openCopyMealPopup(context),
            icon: Icon(
              Icons.copy,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
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
                        onTapTrailing: () async {
                          await ref.read(diaryServiceProvider).editFoodInMeal(
                                log,
                                meal,
                                food.key,
                              );
                        },
                        onTap: () {
                          AutoRouter.of(context).push(
                            FoodDetailsRoute(
                              initialMealIndex: meal.index,
                              log: log,
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
        meal,
        fromTime: log.day.getDateTime(),
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
                  final range = ref.read(dateRangeProvider)!;
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: range[0],
                    lastDate: range[1],
                  );
                  if (picked != null) {
                    setState(() {
                      selectedDate = picked;
                      selectedMeal = null;
                      selectedLog =
                          ref.read(diaryServiceProvider).getLog(selectedDate);
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
    final serving = food.servingSize;
    return FoodListTile(
      name: food.description,
      subtitle: '${food.chosenServingAmount * serving.value} ${serving.unit}',
      n: food.nutritionalContents.servingFactor(food.servingFactor),
      onTap: onTap,
      trailingIcon: const Icon(Icons.delete),
      onTapTrailing: onTapTrailing,
    );
  }
}
