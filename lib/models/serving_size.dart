import 'package:freezed_annotation/freezed_annotation.dart';

part 'serving_size.freezed.dart';
part 'serving_size.g.dart';

@freezed
class ServingSize with _$ServingSize {
  const factory ServingSize({
    required int index,
    required double nutritionMultiplier,
    required String unit,
    required double value,
  }) = _ServingSize;

  factory ServingSize.fromJson(Map<String, Object?> json) =>
      _$ServingSizeFromJson(json);
}
