import 'package:bite_trace/dtos/myfitnesspal_api/food_response.dart';
import 'package:bite_trace/dtos/myfitnesspal_api/nutritional_contents.dart';
import 'package:bite_trace/dtos/myfitnesspal_api/serving_size.dart';
import 'package:bite_trace/models/Food.dart';
import 'package:bite_trace/models/Nutrients.dart';
import 'package:bite_trace/models/ServingSize.dart';

class FoodDtoToFoodMapper {
  static Food foodDtoToFood(
    FoodResponse foodResponse,
    ServingSizeDto chosenServingSize,
  ) {
    final servingSizes =
        foodResponse.servingSizes.map(servingSizeDtoToServingSize).toList();
    return Food(
      description: foodResponse.description,
      foodId: foodResponse.id.toString(),
      nutritionalContents:
          nutritionalContentsDtoToNutrients(foodResponse.nutritionalContents),
      chosenServingSize: chosenServingSize.index,
      servingSizes: servingSizes,
      verified: foodResponse.verified,
      chosenServingAmount: 1,
      brandName: foodResponse.brandName,
      countryCode: foodResponse.countryCode,
    );
  }

  static Nutrients nutritionalContentsDtoToNutrients(
    NutritionalContentsDto dto,
  ) {
    return Nutrients(
      calories: dto.energy?.value ?? 0,
      calcium: dto.calcium,
      carbohydrates: dto.carbohydrates,
      cholesterol: dto.cholesterol,
      fat: dto.fat,
      fiber: dto.fiber,
      iron: dto.iron,
      monounsaturatedFat: dto.monounsaturatedFat,
      polyunsaturatedFat: dto.polyunsaturatedFat,
      potassium: dto.potassium,
      protein: dto.protein,
      saturatedFat: dto.saturatedFat,
      sodium: dto.sodium,
      sugar: dto.sugar,
      transFat: dto.transFat,
      vitaminA: dto.vitaminA,
      vitaminC: dto.vitaminC,
      vitaminD: dto.vitaminD,
    );
  }

  static ServingSize servingSizeDtoToServingSize(ServingSizeDto dto) {
    return ServingSize(
      index: dto.index,
      nutritionMultiplier: dto.nutritionMultiplier,
      unit: dto.unit,
      value: dto.value,
    );
  }
}
