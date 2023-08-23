import 'package:bite_trace/models/food.dart';
import 'package:bite_trace/models/nutrients.dart';

class Macros {
  Macros();

  factory Macros.getMealMacros(List<Food> foods) {
    final Macros m = Macros();
    for (final food in foods) {
      m.addFood(food);
    }
    return m;
  }
  double calories = 0;
  double carbs = 0;
  double fats = 0;
  double protein = 0;

  void addFood(Food food) {
    final serving = food.servingSizes
        .where((element) => element.index == food.chosenServingSize)
        .first;
    calories += food.nutritionalContents.calories * serving.nutritionMultiplier;
    carbs +=
        (food.nutritionalContents.carbohydrates) * serving.nutritionMultiplier;
    fats += (food.nutritionalContents.fat) * serving.nutritionMultiplier;
    protein += (food.nutritionalContents.protein) * serving.nutritionMultiplier;
  }

  Nutrients toNutrients() {
    return Nutrients(
      calories: calories,
      carbohydrates: carbs,
      fat: fats,
      protein: protein,
    );
  }
}
