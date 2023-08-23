import 'package:freezed_annotation/freezed_annotation.dart';

part 'serving_size.freezed.dart';
part 'serving_size.g.dart';

@freezed
class ServingSizeDto with _$ServingSizeDto {
  const factory ServingSizeDto({
    required String id,
    required int index,
    required double nutritionMultiplier,
    required String unit,
    required double value,
  }) = _ServingSize;

  factory ServingSizeDto.fromJson(Map<String, Object?> json) =>
      _$ServingSizeDtoFromJson(json);
}
