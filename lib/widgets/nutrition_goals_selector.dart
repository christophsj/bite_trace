import 'package:bite_trace/models/NutrientGoals.dart';
import 'package:bite_trace/utils/nutrient_goals_extension.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
import 'package:flutter/material.dart';

class NutritionGoalsSelector extends StatefulWidget {
  const NutritionGoalsSelector({
    super.key,
    required this.nutrientGoals,
    required this.onSubmit,
  });

  final NutrientGoals nutrientGoals;
  final Function(NutrientGoals) onSubmit;

  @override
  _NutritionGoalsSelectorState createState() => _NutritionGoalsSelectorState();
}

class _NutritionGoalsSelectorState extends State<NutritionGoalsSelector> {
  late NutrientGoals goals;

  @override
  void initState() {
    goals = widget.nutrientGoals;
    super.initState();
  }

  void _updateCarbPercentage(double value) {
    setState(() {
      goals = goals.copyWith(carbPerc: value.toInt());
    });
  }

  void _updateFatPercentage(double value) {
    setState(() {
      goals = goals.copyWith(fatPerc: value.toInt());
    });
  }

  void _updateProteinPercentage(double value) {
    setState(() {
      goals = goals.copyWith(proteinPerc: value.toInt());
    });
  }

  bool get valid => goals.valid;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        _buildSlider('Carbs', _updateCarbPercentage, goals.carbPerc),
        _buildSlider('Fats', _updateFatPercentage, goals.fatPerc, factor: 9),
        _buildSlider('Protein', _updateProteinPercentage, goals.proteinPerc),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: AnimatedElevatedButton(
            onPressed: !valid
                ? null
                : () {
                    final NutrientGoals n = goals;
                    return widget.onSubmit(n);
                  },
            label: 'Submit',
          ),
        ),
      ],
    );
  }

  Widget _buildSlider(
    String text,
    void Function(double) cb,
    int value, {
    int factor = 4,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  children: [
                    TextSpan(
                      text: '${value.toStringAsFixed(0)}%',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text:
                          ' (${value * widget.nutrientGoals.calories / 100 ~/ factor}g)',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliderTheme(
          data: const SliderThemeData(
            overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
          ),
          child: Slider(
            value: value.toDouble(),
            onChanged: cb,
            min: 1,
            max: 100,
            divisions: 100,
          ),
        ),
      ],
    );
  }
}
