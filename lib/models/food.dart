import 'package:bite_trace/models/nutrients.dart';
import 'package:bite_trace/models/serving_size.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

@freezed
class Food with _$Food {
  const factory Food({
    String? countryCode,
    required String description,
    required int id,
    required Nutrients nutritionalContents,
    required int chosenServingSize,
    required List<ServingSize> servingSizes,
    String? type,
    required bool verified,
    String? brandName,
  }) = _Food;

  factory Food.fromJson(Map<String, Object?> json) => _$FoodFromJson(json);
}
