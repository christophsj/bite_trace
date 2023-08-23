import 'package:bite_trace/dtos/myfitnesspal_api/energy.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutritional_contents.freezed.dart';
part 'nutritional_contents.g.dart';

@freezed
class NutritionalContentsDto with _$NutritionalContentsDto {

  const factory NutritionalContentsDto({
    double? calcium,
    @JsonKey(defaultValue: 0) required double carbohydrates,
    double? cholesterol,
    Energy? energy,
    @JsonKey(defaultValue: 0) required double fat,
    double? fiber,
    double? iron,
    double? monounsaturatedFat,
    double? polyunsaturatedFat,
    double? potassium,
    @JsonKey(defaultValue: 0) required double protein,
    double? saturatedFat,
    double? sodium,
    double? sugar,
    double? vitaminC,
    double? vitaminD,
    double? transFat,
    double? vitaminA,
  }) = _NutritionalContentsDto;
  const NutritionalContentsDto._();

  factory NutritionalContentsDto.fromJson(Map<String, Object?> json) =>
      _$NutritionalContentsDtoFromJson(json);
}
