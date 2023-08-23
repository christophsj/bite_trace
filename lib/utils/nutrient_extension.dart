import 'package:bite_trace/models/Nutrients.dart';

extension NutrientsExtension on Nutrients {
  static Nutrients combine(List<Nutrients> list) {
    if (list.isEmpty) {
      return Nutrients(calories: 0, carbohydrates: 0, protein: 0, fat: 0);
    }
    return list.reduce(
      (a, b) {
        return Nutrients(
          calories: a.calories + b.calories,
          carbohydrates: a.carbohydrates + b.carbohydrates,
          protein: a.protein + b.protein,
          fat: a.fat + b.fat,
          calcium: a.calcium ?? 0 + (b.calcium ?? 0),
          cholesterol: (a.cholesterol ?? 0) + (b.cholesterol ?? 0),
          fiber: (a.fiber ?? 0) + (b.fiber ?? 0),
          iron: (a.iron ?? 0) + (b.iron ?? 0),
          monounsaturatedFat:
              (a.monounsaturatedFat ?? 0) + (b.monounsaturatedFat ?? 0),
          polyunsaturatedFat:
              (a.polyunsaturatedFat ?? 0) + (b.polyunsaturatedFat ?? 0),
          potassium: (a.potassium ?? 0) + (b.potassium ?? 0),
          saturatedFat: (a.saturatedFat ?? 0) + (b.saturatedFat ?? 0),
          sodium: (a.sodium ?? 0) + (b.sodium ?? 0),
          sugar: (a.sugar ?? 0) + (b.sugar ?? 0),
          vitaminC: (a.vitaminC ?? 0) + (b.vitaminC ?? 0),
          vitaminD: (a.vitaminD ?? 0) + (b.vitaminD ?? 0),
          transFat: (a.transFat ?? 0) + (b.transFat ?? 0),
          vitaminA: (a.vitaminA ?? 0) + (b.vitaminA ?? 0),
        );
      },
    );
  }
}
