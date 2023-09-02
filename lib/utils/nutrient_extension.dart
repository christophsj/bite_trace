import 'package:bite_trace/models/Nutrients.dart';

extension NutrientsExtension on Nutrients {
  Nutrients servingFactor(double factor) {
    return copyWith(
      calcium: calcium == null ? null : calcium! * factor,
      calories: calories * factor,
      carbohydrates: carbohydrates * factor,
      cholesterol: cholesterol == null ? null : cholesterol! * factor,
      fat: fat * factor,
      fiber: fiber == null ? null : fiber! * factor,
      iron: iron == null ? null : iron! * factor,
      monounsaturatedFat:
          monounsaturatedFat == null ? null : monounsaturatedFat! * factor,
      polyunsaturatedFat:
          polyunsaturatedFat == null ? null : polyunsaturatedFat! * factor,
      potassium: potassium == null ? null : potassium! * factor,
      protein: protein * factor,
      saturatedFat: saturatedFat == null ? null : saturatedFat! * factor,
      sodium: sodium == null ? null : sodium! * factor,
      sugar: sugar == null ? null : sugar! * factor,
      transFat: transFat == null ? null : transFat! * factor,
      vitaminA: vitaminA == null ? null : vitaminA! * factor,
      vitaminB12: vitaminB12 == null ? null : vitaminB12! * factor,
      vitaminB1: vitaminB1 == null ? null : vitaminB1! * factor,
      vitaminB2: vitaminB2 == null ? null : vitaminB2! * factor,
      vitaminB6: vitaminB6 == null ? null : vitaminB6! * factor,
      vitaminB9: vitaminB9 == null ? null : vitaminB9! * factor,
      vitaminC: vitaminC == null ? null : vitaminC! * factor,
      vitaminD: vitaminD == null ? null : vitaminD! * factor,
      vitaminE: vitaminE == null ? null : vitaminE! * factor,
      vitaminK: vitaminK == null ? null : vitaminK! * factor,
      vitaminPP: vitaminPP == null ? null : vitaminPP! * factor,
    );
  }

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
