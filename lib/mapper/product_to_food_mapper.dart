import 'package:bite_trace/models/ModelProvider.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class ProductToFoodMapper {
  static Food productToFood(
    Product product,
    double amount,
  ) {
    return Food(
      description: product.productName ?? '<missing-description>',
      foodId: product.barcode ?? '<missing-bardcode>',
      countryCode: product.countries,
      nutritionalContents:
          nutrimentsToNutrients(product.nutriments ?? Nutriments.empty()),
      brandName: product.brands,
      imageUrl: product.imageFrontSmallUrl,
      servingSizes: [
        ServingSize(
          index: 0,
          nutritionMultiplier: 1,
          unit: '100g',
          value: 100,
        ),
      ],
      chosenServingSize: 0,
      chosenServingAmount: 1,
      verified: false,
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
