import 'package:bite_trace/models/Nutrients.dart';
import 'package:bite_trace/utils/context_extension.dart';
import 'package:bite_trace/widgets/segmented_circle.dart';
import 'package:flutter/material.dart';

class MacrosDisplay extends StatelessWidget {
  const MacrosDisplay({
    super.key,
    required this.nutrients,
  });

  final Nutrients nutrients;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SegmentedCircle(
                colors: [
                  context.appColors.carbColor,
                  context.appColors.fatColor,
                  context.appColors.proteinColor,
                ],
                segmentAngles: [
                  (nutrients.carbohydrates) * 4,
                  (nutrients.fat) * 9,
                  (nutrients.protein) * 4,
                ],
                vals: const ['C', 'F', 'P'],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Calories',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          nutrients.calories.toInt().toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Icon(Icons.local_fire_department),
                      ],
                    ),
                    for (final entry in {
                      'Carbs': (
                        nutrients.carbohydrates,
                        context.appColors.carbColor
                      ),
                      'Fats': (nutrients.fat, context.appColors.fatColor),
                      'Protein': (
                        nutrients.protein,
                        context.appColors.proteinColor
                      ),
                    }.entries)
                      Row(
                        children: [
                          Text(
                            entry.key,
                            style: TextStyle(
                              color: entry.value.$2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '${(entry.value.$1 * 10).toInt() / 10}g',
                            style: TextStyle(
                              color: entry.value.$2,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(
            height: 6,
          ),
          // SegmentedProgressIndicator(
          //   height: 20,
          //   colors: const [
          //     CustomColors.carbColor,
          //     CustomColors.fatColor,
          //     CustomColors.proteinColor,
          //   ],
          //   segmentLengths: [
          //     (nutrients.carbohydrates) * 4,
          //     (nutrients.fat) * 9,
          //     (nutrients.protein) * 4
          //   ],
          //   vals: const ['C', 'F', 'P'],
          // ),
        ],
      ),
    );
  }
}

class MicroNutrientsDisplay extends StatelessWidget {
  const MicroNutrientsDisplay({super.key, required this.nutrients});

  final Nutrients nutrients;

  String displayForGrams(double? item) {
    if (item == null) {
      return 'N/A';
    }
    const rounding = 1000;
    return '${(item * rounding).toInt() / rounding}g';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final entry in {
          'Sugar': nutrients.sugar,
          'Calcium': nutrients.calcium,
          'Cholesterol': nutrients.cholesterol,
          'Fiber': nutrients.fiber,
          'Iron': nutrients.iron,
          'Monounsaturated Fat': nutrients.monounsaturatedFat,
          'Polyunsaturated Fat': nutrients.polyunsaturatedFat,
          'Potassium': nutrients.potassium,
          'Saturated Fat': nutrients.saturatedFat,
          'Sodium': nutrients.sodium,
          'Vitamin C': nutrients.vitaminC,
          'Vitamin D': nutrients.vitaminD,
          'Trans Fat': nutrients.transFat,
          'Vitamin A': nutrients.vitaminA,
        }.entries)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                entry.key,
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                displayForGrams(entry.value),
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
      ],
    );
  }
}

class SegmentedProgressIndicator extends StatelessWidget {
  const SegmentedProgressIndicator({
    required this.colors,
    required this.segmentLengths,
    required this.vals,
    this.height = 10,
  });
  final List<Color> colors;
  final List<double> segmentLengths;
  final List<String> vals;
  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final List<Widget> segments = [];

        final double totalLength =
            segmentLengths.reduce((value, element) => value + element);

        if (totalLength == 0) {
          return Container();
        }

        for (int i = 0; i < colors.length; i++) {
          final w = constraints.maxWidth * (segmentLengths[i] / totalLength);
          segments.add(
            Container(
              width: w,
              height: height,
              color: colors[i],
              child: (w < 8)
                  ? null
                  : Center(
                      child: Text(
                        vals[i],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          );
        }
        return Row(
          children: segments,
        );
      },
    );
  }
}
