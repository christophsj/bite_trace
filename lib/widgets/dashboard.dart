import 'package:bite_trace/constants.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/models/Food.dart';
import 'package:bite_trace/models/Nutrients.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard(this.data, this.foods, {super.key});

  final AccountData data;
  final List<Food> foods;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProgressIndicatorWithValue(
                    goal: data.nutrientGoals.calories,
                    value: n.calories,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  _buildMacroRow(n),
                  // _buildBaseGoalFoodExercise(theme, context, n),
                ],
              ),
            ),
          )
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (final macro in [
          (
            data.nutrientGoals.carbPerc,
            n.carbohydrates,
            CustomColors.carbColor,
            4,
            'C'
          ),
          (data.nutrientGoals.fatPerc, n.fat, CustomColors.fatColor, 9, 'F'),
          (
            data.nutrientGoals.proteinPerc,
            n.protein,
            CustomColors.proteinColor,
            4,
            'P'
          ),
        ])
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ProgressIndicatorWithValue(
              goal: macro.$1 / macro.$4 * data.nutrientGoals.calories / 100,
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
  }
}

class ProgressIndicatorWithValue extends StatelessWidget {
  const ProgressIndicatorWithValue({
    super.key,
    required this.goal,
    required this.value,
    this.size,
    this.color,
    this.labelBelow = false,
    this.strokeWidth = 10,
    this.label,
  });

  final num goal;
  final num value;
  final double? size;
  final Color? color;
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
          _buildLabelBelow(context)
        ],
      );
    }
    return Stack(
      alignment: Alignment.center,
      children: [_buildCircle(), _buildLabel(context)],
    );
  }

  Widget _buildCircle({String? label}) {
    final circle = SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        value: progress,
        backgroundColor: Colors.grey[400],
        color: color,
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
            text: '$diff${labelBelow ? '' : '\n'}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          TextSpan(
            text: diff >= 0 ? 'left' : 'over',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLabelBelow(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Theme.of(context).colorScheme.onBackground,
          fontWeight: FontWeight.normal,
        ),
        children: [
          TextSpan(
            text: '${value.toInt()}',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          TextSpan(
            text: ' / ${goal.toInt()}g',
          )
        ],
      ),
    );
  }
}
