import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage<Food?>()
class FoodDetailsScreen extends ConsumerStatefulWidget {
  const FoodDetailsScreen({
    required this.initialMealIndex,
    required this.log,
    required this.food,
    super.key,
  });

  final Food food;
  final DiaryEntry log;
  final int initialMealIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<FoodDetailsScreen> {
  int selectedServingIndex = 0;
  int selectedMealIndex = 0;

  final TextEditingController amount = TextEditingController(text: '1');

  @override
  void initState() {
    selectedMealIndex = widget.initialMealIndex;
    selectedServingIndex = widget.food.chosenServingSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final acc = ref.read(accountDataProvider);
    final nc = widget.food.nutritionalContents;

    final dropdownTextStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).colorScheme.onBackground,
    );

    final dropdownDecoration = BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(4),
    );

    final inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      fillColor: Theme.of(context).colorScheme.background,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.food.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MacrosDisplay(nutrients: nc),
              const SizedBox(
                height: 20,
              ),
              MicroNutrientsDisplay(
                nutrients: nc,
              ),
              for (final entry in {
                'Brand': widget.food.brandName,
                'Origin': widget.food.countryCode,
              }.entries)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry.key,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      entry.value ?? 'N/A',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              const SizedBox(
                height: 30,
              ),
              ColoredBox(
                color: Theme.of(context).colorScheme.background,
                child: Row(
                  children: [
                    Column(
                      children: [
                        const Text('Amount'),
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 70,
                          child: TextField(
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            controller: amount,
                            decoration: inputDecoration,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Serving Size'),
                          const SizedBox(
                            height: 4,
                          ),
                          DecoratedBox(
                            decoration: dropdownDecoration,
                            child: DropdownButton(
                              isExpanded: true,
                              dropdownColor:
                                  Theme.of(context).colorScheme.background,
                              underline: Container(),
                              value: selectedServingIndex,
                              items: widget.food.servingSizes.map((e) {
                                return DropdownMenuItem(
                                  value: e.index,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      e.unit,
                                      style: dropdownTextStyle,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (s) {
                                setState(() {
                                  if (s != null) selectedServingIndex = s;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 50,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: DecoratedBox(
                        decoration: dropdownDecoration,
                        child: DropdownButton(
                          isExpanded: true,
                          underline: Container(),
                          value: selectedMealIndex,
                          items: widget.log.meals!
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.index,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
                                    child: Text(
                                      e.name,
                                      style: dropdownTextStyle,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (i) {
                            if (i != null) {
                              setState(() {
                                selectedMealIndex = i;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    AnimatedElevatedButton(
                      onPressed: () async {
                        final selectedMeal =
                            widget.log.meals![selectedMealIndex];
                        await ref.read(diaryServiceProvider).addFoodsToMeal(
                          widget.log,
                          selectedMeal,
                          [widget.food],
                        );
                        ref.read(routerProvider).pop<Food?>(widget.food);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(
                        'LOG',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
