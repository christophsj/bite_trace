import 'dart:async';

import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/num_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:bite_trace/widgets/nutrients_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodDetails extends ConsumerStatefulWidget {
  const FoodDetails({
    required this.initialMealIndex,
    required this.food,
    required this.onSubmit,
    this.meals,
    this.label = 'LOG',
    this.icon = Icons.add,
    this.foodIdx,
    super.key,
  });

  final Food food;
  final int initialMealIndex;
  final List<String>? meals;
  final int? foodIdx;
  final Future<void> Function(int, int, String) onSubmit;
  final String label;
  final IconData icon;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends ConsumerState<FoodDetails>
    with TickerProviderStateMixin {
  late int selectedServingIndex;
  late int selectedMealIndex;

  late final TextEditingController amount;
  late final AnimationController _animController;
  late Animation<double> _factorAnimation;

  @override
  void initState() {
    selectedServingIndex = widget.food.chosenServingSize;
    selectedMealIndex = widget.initialMealIndex;

    final amountValue = widget.food.chosenServingAmount;
    final multi = widget.food.multi;

    _animController = AnimationController(
      value: 0,
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _factorAnimation = Tween(
      begin: 0.0,
      end: amountValue * multi,
    ).animate(_animController);

    amount = TextEditingController(
      text: amountValue.toStringWithoutTrailingZeros(),
    )..addListener(updateAmountValue);
    _animController.forward();
    super.initState();
  }

  void updateAmountValue() {
    final amt = double.tryParse(amount.text);
    final s = widget.food.servingSizes
            .where((element) => element.index == selectedServingIndex)
            .firstOrNull ??
        widget.food.servingSizes.first;
    final end = (amt ?? 0) * s.nutritionMultiplier;
    _factorAnimation = Tween(
      begin: _factorAnimation.value,
      end: end,
    ).animate(_animController);

    if (_animController.isCompleted || _animController.isAnimating) {
      _animController.reset();
    }
    _animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownTextStyle = TextStyle(
      fontSize: 18,
      color: Theme.of(context).colorScheme.onSurface,
    );

    final inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.food.description} ${widget.food.verified ? '✅' : ''}',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: AnimatedBuilder(
            animation: _animController,
            builder: (context, child) {
              final nc = widget.food.nutritionalContents.servingFactor(
                _factorAnimation.value,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MacrosDisplay(nutrients: nc),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
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
                                const SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    entry.value ?? 'N/A',
                                    style: const TextStyle(fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  child!,
                ],
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 70,
                              child: TextField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                controller: amount,
                                decoration: inputDecoration.copyWith(
                                  labelText: 'Servings',
                                ),
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
                              DropdownButtonFormField(
                                isExpanded: true,
                                dropdownColor:
                                    Theme.of(context).colorScheme.surface,
                                value: selectedServingIndex,
                                decoration: inputDecoration.copyWith(
                                  labelText: 'Serving Size',
                                ),
                                items: widget.food.servingSizes.map((e) {
                                  return DropdownMenuItem(
                                    value: e.index,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        '${e.value} ${e.unit}',
                                        style: dropdownTextStyle,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (s) {
                                  if (s != null) {
                                    selectedServingIndex = s;
                                    updateAmountValue();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (widget.foodIdx == null)
                            Expanded(
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                value: selectedMealIndex,
                                decoration: inputDecoration.copyWith(
                                  labelText: 'Meal',
                                ),
                                items: widget.meals!
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: widget.meals!.indexOf(e),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: Text(
                                            e,
                                            style: dropdownTextStyle,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (int? i) {
                                  if (i != null) {
                                    setState(() {
                                      selectedMealIndex = i;
                                    });
                                  }
                                },
                              ),
                            ),
                          const SizedBox(
                            width: 6,
                          ),
                          AnimatedElevatedButton(
                            onPressed: () => widget.onSubmit(
                              selectedMealIndex,
                              selectedServingIndex,
                              amount.text,
                            ),
                            icon: Icon(
                              widget.icon,
                            ),
                            label: widget.label,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
