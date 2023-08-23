// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrients.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Nutrients _$$_NutrientsFromJson(Map json) => _$_Nutrients(
      calories: (json['calories'] as num).toDouble(),
      carbohydrates: (json['carbohydrates'] as num?)?.toDouble() ?? 0,
      protein: (json['protein'] as num?)?.toDouble() ?? 0,
      fat: (json['fat'] as num?)?.toDouble() ?? 0,
      calcium: (json['calcium'] as num?)?.toDouble(),
      cholesterol: (json['cholesterol'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      iron: (json['iron'] as num?)?.toDouble(),
      monounsaturatedFat: (json['monounsaturated_fat'] as num?)?.toDouble(),
      polyunsaturatedFat: (json['polyunsaturated_fat'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      saturatedFat: (json['saturated_fat'] as num?)?.toDouble(),
      sodium: (json['sodium'] as num?)?.toDouble(),
      sugar: (json['sugar'] as num?)?.toDouble(),
      vitaminC: (json['vitamin_c'] as num?)?.toDouble(),
      vitaminD: (json['vitamin_d'] as num?)?.toDouble(),
      transFat: (json['trans_fat'] as num?)?.toDouble(),
      vitaminA: (json['vitamin_a'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NutrientsToJson(_$_Nutrients instance) =>
    <String, dynamic>{
      'calories': instance.calories,
      'carbohydrates': instance.carbohydrates,
      'protein': instance.protein,
      'fat': instance.fat,
      'calcium': instance.calcium,
      'cholesterol': instance.cholesterol,
      'fiber': instance.fiber,
      'iron': instance.iron,
      'monounsaturated_fat': instance.monounsaturatedFat,
      'polyunsaturated_fat': instance.polyunsaturatedFat,
      'potassium': instance.potassium,
      'saturated_fat': instance.saturatedFat,
      'sodium': instance.sodium,
      'sugar': instance.sugar,
      'vitamin_c': instance.vitaminC,
      'vitamin_d': instance.vitaminD,
      'trans_fat': instance.transFat,
      'vitamin_a': instance.vitaminA,
    };
