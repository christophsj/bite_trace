// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meal _$$_MealFromJson(Map json) => _$_Meal(
      name: json['name'] as String,
      foods: (json['foods'] as List<dynamic>)
          .map((e) => Food.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      index: json['index'] as int,
    );

Map<String, dynamic> _$$_MealToJson(_$_Meal instance) => <String, dynamic>{
      'name': instance.name,
      'foods': instance.foods.map((e) => e.toJson()).toList(),
      'index': instance.index,
    };
