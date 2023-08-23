import 'package:bite_trace/dtos/myfitnesspal_api/nutritional_contents.dart';
import 'package:bite_trace/dtos/myfitnesspal_api/serving_size.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_response.freezed.dart';
part 'food_response.g.dart';

@freezed
class FoodResponse with _$FoodResponse {
  const factory FoodResponse({
    String? countryCode,
    required bool deleted,
    required String description,
    required int id,
    required NutritionalContentsDto nutritionalContents,
    required bool public,
    required List<ServingSizeDto> servingSizes,
    String? type,
    String? userId,
    required bool verified,
    String? version,
    String? brandName,
  }) = _FoodResponse;

  factory FoodResponse.fromJson(Map<String, Object?> json) =>
      _$FoodResponseFromJson(json);
}
