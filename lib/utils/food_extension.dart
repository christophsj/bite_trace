import 'package:bite_trace/models/ModelProvider.dart';

extension FoodExtension on Food {
  double get servingFactor {
    return multi * chosenServingAmount;
  }

  double get multi {
    return servingSize.nutritionMultiplier;
  }

  ServingSize get servingSize {
    return servingSizes
            .where((element) => element.index == chosenServingSize)
            .firstOrNull ??
        servingSizes.first;
  }
}
