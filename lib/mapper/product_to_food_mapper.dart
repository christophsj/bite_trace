import 'package:bite_trace/models/ModelProvider.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductToFoodMapper {
  static Food productToFood(
    Product product,
  ) {
    final perServing = _getPerServingSize(product);
    return Food(
      description: product.productName ??
          product.productNameInLanguages?[OpenFoodFactsLanguage.ENGLISH] ??
          product.productNameInLanguages?[OpenFoodFactsLanguage.GERMAN] ??
          product.productNameInLanguages?.entries.firstOrNull?.value ??
          '<missing-name>',
      foodId: product.barcode ?? '<missing-bardcode>',
      countryCode: product.countries,
      nutritionalContents:
          nutrimentsToNutrients(product.nutriments ?? Nutriments.empty()),
      brandName: product.brands,
      imageUrl: product.imageFrontSmallUrl,
      servingSizes: [
        if (perServing != null) perServing,
        ServingSize(
          index: perServing == null ? 0 : 1,
          nutritionMultiplier: 0.01,
          unit: 'g',
          value: 1,
        ),
        ServingSize(
          index: perServing == null ? 1 : 2,
          nutritionMultiplier: 1,
          unit: 'g',
          value: 100,
        ),
      ],
      chosenServingSize: 0,
      chosenServingAmount: perServing == null ? 100 : 1,
      verified: false,
    );
  }

  static ServingSize? _getPerServingSize(Product p) {
    if (p.nutriments == null) return null;

    final nutriments = p.nutriments!;
    final v1 =
        nutriments.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams);
    final v2 = nutriments.getValue(Nutrient.energyKCal, PerSize.serving);
    if (v1 == null || v2 == null) {
      return null;
    }

    if (p.servingQuantity == null) {
      return null;
    }

    final factor = v2 / v1;
    return ServingSize(
      index: 0,
      nutritionMultiplier: factor,
      unit: 'g',
      value: p.servingQuantity!,
    );
  }

  static Nutrients nutrimentsToNutrients(Nutriments nutriments) {
    return Nutrients(
      calories:
          nutriments.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams) ??
              0,
      carbohydrates: nutriments.getValue(
            Nutrient.carbohydrates,
            PerSize.oneHundredGrams,
          ) ??
          0,
      protein:
          nutriments.getValue(Nutrient.proteins, PerSize.oneHundredGrams) ?? 0,
      fat: nutriments.getValue(Nutrient.fat, PerSize.oneHundredGrams) ?? 0,
      calcium:
          nutriments.getValue(Nutrient.calcium, PerSize.oneHundredGrams) ?? 0,
      cholesterol:
          nutriments.getValue(Nutrient.cholesterol, PerSize.oneHundredGrams) ??
              0,
      fiber: nutriments.getValue(Nutrient.fiber, PerSize.oneHundredGrams) ?? 0,
      iron: nutriments.getValue(Nutrient.iron, PerSize.oneHundredGrams) ?? 0,
      monounsaturatedFat: nutriments.getValue(
            Nutrient.monounsaturatedFat,
            PerSize.oneHundredGrams,
          ) ??
          0,
      polyunsaturatedFat: nutriments.getValue(
            Nutrient.polyunsaturatedFat,
            PerSize.oneHundredGrams,
          ) ??
          0,
      potassium:
          nutriments.getValue(Nutrient.potassium, PerSize.oneHundredGrams) ?? 0,
      saturatedFat:
          nutriments.getValue(Nutrient.saturatedFat, PerSize.oneHundredGrams) ??
              0,
      sodium:
          nutriments.getValue(Nutrient.sodium, PerSize.oneHundredGrams) ?? 0,
      sugar: nutriments.getValue(Nutrient.sugars, PerSize.oneHundredGrams) ?? 0,
      transFat:
          nutriments.getValue(Nutrient.transFat, PerSize.oneHundredGrams) ?? 0,
      vitaminA:
          nutriments.getValue(Nutrient.vitaminA, PerSize.oneHundredGrams) ?? 0,
      vitaminC:
          nutriments.getValue(Nutrient.vitaminC, PerSize.oneHundredGrams) ?? 0,
      vitaminD:
          nutriments.getValue(Nutrient.vitaminD, PerSize.oneHundredGrams) ?? 0,
      vitaminB12:
          nutriments.getValue(Nutrient.vitaminB12, PerSize.oneHundredGrams) ??
              0,
      vitaminB1:
          nutriments.getValue(Nutrient.vitaminB1, PerSize.oneHundredGrams) ?? 0,
      vitaminB2:
          nutriments.getValue(Nutrient.vitaminB2, PerSize.oneHundredGrams) ?? 0,
      vitaminB6:
          nutriments.getValue(Nutrient.vitaminB6, PerSize.oneHundredGrams) ?? 0,
      vitaminB9:
          nutriments.getValue(Nutrient.vitaminB9, PerSize.oneHundredGrams) ?? 0,
      vitaminE:
          nutriments.getValue(Nutrient.vitaminE, PerSize.oneHundredGrams) ?? 0,
      vitaminK:
          nutriments.getValue(Nutrient.vitaminK, PerSize.oneHundredGrams) ?? 0,
      vitaminPP:
          nutriments.getValue(Nutrient.vitaminPP, PerSize.oneHundredGrams) ?? 0,
    );
  }
}
