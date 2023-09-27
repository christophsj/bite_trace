import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/context_extension.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard(this.goals, this.foods, {super.key});

  final NutrientGoals goals;
  final List<Food> foods;

  @override
  Widget build(BuildContext context) {
    final n = NutrientsExtension.combine(
      foods
          .map((e) => e.nutritionalContents.servingFactor(e.servingFactor))
          .toList(),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(4),
              //   border: Border.all(
              //     color: Theme.of(context).colorScheme.outlineVariant,
              //   ),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProgressIndicatorWithValue(
                    goal: goals.calories,
                    value: n.calories,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  _buildMacroRow(n),
                  // _buildBaseGoalFoodExercise(theme, context, n),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Column _buildBaseGoalFoodExercise(
  //   ThemeData theme,
  //   BuildContext context,
  //   Nutrients n,
  // ) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       _buildSmallIconHeaderValue(
  //         Icon(
  //           Icons.flag,
  //           color: theme.colorScheme.secondary,
  //         ),
  //         'Base Goal',
  //         data.nutrientGoals.calories.toString(),
  //         Theme.of(context),
  //       ),
  //       const SizedBox(height: 8),
  //       _buildSmallIconHeaderValue(
  //         Icon(
  //           Icons.restaurant,
  //           color: theme.colorScheme.secondary,
  //         ),
  //         'Food',
  //         n.calories.toInt().toString(),
  //         Theme.of(context),
  //       ),
  //       const SizedBox(height: 8),
  //       _buildSmallIconHeaderValue(
  //         Icon(
  //           Icons.heart_broken,
  //           color: theme.colorScheme.secondary,
  //         ),
  //         'Exercise',
  //         '0',
  //         Theme.of(context),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildMacroRow(Nutrients n) {
    return Builder(
      builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (final macro in [
              (
                goals.carbPerc,
                n.carbohydrates,
                context.appColors.carbColor,
                4,
                'C'
              ),
              (goals.fatPerc, n.fat, context.appColors.fatColor, 9, 'F'),
              (
                goals.proteinPerc,
                n.protein,
                context.appColors.proteinColor,
                4,
                'P'
              ),
            ])
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ProgressIndicatorWithValue(
                  goal: macro.$1 / macro.$4 * goals.calories / 100,
                  value: macro.$2,
                  color: macro.$3,
                  labelBelow: true,
                  strokeWidth: 5,
                  label: macro.$5,
                  size: 45,
                ),
              ),
          ],
        );
      },
    );
  }
}

class ProgressIndicatorWithValue extends StatelessWidget {
  const ProgressIndicatorWithValue({
    super.key,
    required this.goal,
    required this.value,
    this.size,
    required this.color,
    this.labelBelow = false,
    this.strokeWidth = 10,
    this.label,
  });

  final num goal;
  final num value;
  final double? size;
  final Color color;
  final bool labelBelow;
  final String? label;
  final double strokeWidth;

  int get diff => (goal - value).toInt();
  double get progress => value / goal;

  @override
  Widget build(BuildContext context) {
    if (labelBelow) {
      return Column(
        children: [
          _buildCircle(label: label),
          const SizedBox(
            height: 6,
          ),
          _buildLabelBelow(context, color),
        ],
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [_buildCircle(), _buildLabel(context)],
    );
  }

  Widget _buildCircle({String? label}) {
    final c = color;
    final circle = SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey[400],
        color: c,
        strokeWidth: strokeWidth,
      ),
    );

    if (label != null) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Text(label),
          circle,
        ],
      );
    }

    return circle;
  }

  Widget _buildLabel(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: '${diff.abs()}${labelBelow ? '' : '\n'}',
            style: TextStyle(
              color: diff < 0
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: diff >= 0 ? 'left' : 'over',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelBelow(BuildContext context, Color color) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: '${value.toInt()}',
            style: TextStyle(color: color),
          ),
          TextSpan(
            text: ' / ${goal.toInt()}g',
          ),
        ],
      ),
    );
  }
}
