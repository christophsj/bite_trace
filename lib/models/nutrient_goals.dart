import 'package:bite_trace/models/nutrients.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrient_goals.freezed.dart';
part 'nutrient_goals.g.dart';

@freezed
class NutrientGoals with _$NutrientGoals {
  const factory NutrientGoals({
    required int calories,
    required int carbPerc,
    required int proteinPerc,
    required int fatPerc,
    Nutrients? otherNutrients,
  }) = _NutrientGoals;

  factory NutrientGoals.fromJson(Map<String, Object?> json) =>
      _$NutrientGoalsFromJson(json);
  const NutrientGoals._();

  bool get valid => carbPerc + proteinPerc + fatPerc == 100;
}
