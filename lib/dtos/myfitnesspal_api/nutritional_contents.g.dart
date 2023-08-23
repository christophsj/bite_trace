// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutritional_contents.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NutritionalContentsDto _$$_NutritionalContentsDtoFromJson(Map json) =>
    _$_NutritionalContentsDto(
      calcium: (json['calcium'] as num?)?.toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble() ?? 0,
      cholesterol: (json['cholesterol'] as num?)?.toDouble(),
      energy: json['energy'] == null
          ? null
          : Energy.fromJson(Map<String, Object?>.from(json['energy'] as Map)),
      fat: (json['fat'] as num?)?.toDouble() ?? 0,
      fiber: (json['fiber'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
      monounsaturatedFat: (json['monounsaturated_fat'] as num?)?.toDouble(),
      polyunsaturatedFat: (json['polyunsaturated_fat'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble() ?? 0,
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      vitaminD: (json['vitamin_d'] as num?)?.toDouble(),
      transFat: (json['trans_fat'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NutritionalContentsDtoToJson(
        _$_NutritionalContentsDto instance) =>
    <String, dynamic>{
      'calcium': instance.calcium,
      'carbohydrates': instance.carbohydrates,
      'cholesterol': instance.cholesterol,
      'energy': instance.energy?.toJson(),
      'fat': instance.fat,
      'fiber': instance.fiber,
      'iron': instance.iron,
      'monounsaturated_fat': instance.monounsaturatedFat,
      'polyunsaturated_fat': instance.polyunsaturatedFat,
      'potassium': instance.potassium,
      'protein': instance.protein,
      'saturated_fat': instance.saturatedFat,
      'sodium': instance.sodium,
      'sugar': instance.sugar,
      'vitamin_c': instance.vitaminC,
      'vitamin_d': instance.vitaminD,
      'trans_fat': instance.transFat,
      'vitamin_a': instance.vitaminA,
    };
