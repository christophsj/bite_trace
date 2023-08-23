import 'package:bite_trace/models/account_data.dart';
import 'package:bite_trace/models/food.dart';
import 'package:bite_trace/utils/macros.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard(this.data, this.foods, {super.key});

  final AccountData data;
  final List<Food> foods;

  Widget _buildSmallIconHeaderValue(Widget icon, String header, String value) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: const TextStyle(fontSize: 13),
            ),
            Text(value),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final macros = Macros.getMealMacros(foods);

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
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            value: macros.calories / data.nutrients.calories,
                            backgroundColor: Colors.grey[400],
                            strokeWidth: 10,
                          ),
                        ),
                        Text(
                            '${(data.nutrients.calories - macros.calories).toInt()} left',)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSmallIconHeaderValue(
                            Icon(
                              Icons.flag,
                              color: theme.colorScheme.primary,
                            ),
                            'Base Goal',
                            data.nutrients.calories.toString(),),
                        const SizedBox(height: 8),
                        _buildSmallIconHeaderValue(
                            Icon(Icons.restaurant,
                                color: theme.colorScheme.primary,),
                            'Food',
                            macros.calories.toInt().toString(),),
                        const SizedBox(height: 8),
                        _buildSmallIconHeaderValue(
                            Icon(Icons.heart_broken,
                                color: theme.colorScheme.primary,),
                            'Exercise',
                            '0',),
                      ],
                    ),
                  ],),
            ),
          )
        ],
      ),
    );
  }
}
