import 'package:bite_trace/dtos/myfitnesspal_api/food_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item.g.dart';
part 'item.freezed.dart';

@freezed
class FoodApiItem with _$FoodApiItem {
  const factory FoodApiItem({
    required FoodResponse item,
    required List<String> tags,
    required String type,
  }) = _FoodApiItem;

  factory FoodApiItem.fromJson(Map<String, Object?> json) =>
      _$FoodApiItemFromJson(json);
}
