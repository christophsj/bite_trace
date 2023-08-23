// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DailyLog _$$_DailyLogFromJson(Map json) => _$_DailyLog(
      day: DailyLog.dtFromJson(json['day'] as int),
      meals: (json['meals'] as Map).map(
        (k, e) => MapEntry(
            k as String, Meal.fromJson(Map<String, Object?>.from(e as Map))),
      ),
      sortedMeals:
          (DailyLog.getSortedMeals(json, 'sorted_meals') as List<dynamic>)
              .map((e) => Meal.fromJson(Map<String, Object?>.from(e as Map)))
              .toList(),
      id: json['id'] as String,
    );

Map<String, dynamic> _$$_DailyLogToJson(_$_DailyLog instance) =>
    <String, dynamic>{
      'day': DailyLog.dtToJson(instance.day),
      'meals': instance.meals.map((k, e) => MapEntry(k, e.toJson())),
      'id': instance.id,
    };
