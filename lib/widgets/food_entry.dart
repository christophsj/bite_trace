import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/num_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:flutter/material.dart';

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
      subtitle:
          '${(food.chosenServingAmount * serving.value).toStringWithoutTrailingZeros()} ${serving.unit}',
      n: food.nutritionalContents.servingFactor(food.servingFactor),
      onTap: onTap,
      trailingIcon: const Icon(Icons.delete),
      onTapTrailing: onTapTrailing,
      brandName: food.brandName,
    );
  }
}
