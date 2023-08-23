import 'package:bite_trace/models/meal.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_log.freezed.dart';
part 'daily_log.g.dart';

@freezed
class DailyLog with _$DailyLog {
  const factory DailyLog({
    @JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
    required DateTime day,
    required Map<String, Meal> meals,
    @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
    required List<Meal> sortedMeals,
    required String id,
  }) = _DailyLog;
  const DailyLog._();

  factory DailyLog.fromJson(Map<String, Object?> json) =>
      _$DailyLogFromJson(json);

  static DateTime dtFromJson(int int) =>
      DateTime.fromMillisecondsSinceEpoch(int);

  static List<Map<String, dynamic>> getSortedMeals(
    Map<dynamic, dynamic> x,
    String _,
  ) =>
      sortMeals(
        Map<String, Map<String, dynamic>>.from(x['meals'] as Map)
            .map((key, value) => MapEntry(key, Meal.fromJson(value))),
      ).map((e) => e.toJson()).toList();

  static List<Meal> sortMeals(Map<String, Meal> x) =>
      x.values.toList()..sort((a, b) => a.index.compareTo(b.index));

  static int dtToJson(DateTime time) => time.millisecondsSinceEpoch;

  int getTotalCalories() {
    return meals.values
        .map((e) => e.foods)
        .expand((element) => element)
        .map((e) => e.nutritionalContents.calories)
        .reduce((a, b) => a + b)
        .toInt();
  }
}
