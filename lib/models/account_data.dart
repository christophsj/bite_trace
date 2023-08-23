import 'package:bite_trace/models/nutrient_goals.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_data.freezed.dart';
part 'account_data.g.dart';

@freezed
class AccountData with _$AccountData {
  const factory AccountData({
    required String uid,
    required String username,
    required NutrientGoals nutrients,
    required List<String>? mealNames,
  }) = _AccountData;

  factory AccountData.fromJson(Map<String, Object?> json) =>
      _$AccountDataFromJson(json);
}
