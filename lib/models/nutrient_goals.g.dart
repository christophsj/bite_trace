// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrient_goals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NutrientGoals _$$_NutrientGoalsFromJson(Map json) => _$_NutrientGoals(
      calories: json['calories'] as int,
      carbPerc: json['carb_perc'] as int,
      proteinPerc: json['protein_perc'] as int,
      fatPerc: json['fat_perc'] as int,
      otherNutrients: json['other_nutrients'] == null
          ? null
          : Nutrients.fromJson(
              Map<String, Object?>.from(json['other_nutrients'] as Map)),
    );

Map<String, dynamic> _$$_NutrientGoalsToJson(_$_NutrientGoals instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carb_perc': instance.carbPerc,
      'protein_perc': instance.proteinPerc,
      'fat_perc': instance.fatPerc,
      'other_nutrients': instance.otherNutrients?.toJson(),
    };
