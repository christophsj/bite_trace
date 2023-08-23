// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serving_size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ServingSize _$$_ServingSizeFromJson(Map json) => _$_ServingSize(
      id: json['id'] as String,
      index: json['index'] as int,
      nutritionMultiplier: (json['nutrition_multiplier'] as num).toDouble(),
      unit: json['unit'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$_ServingSizeToJson(_$_ServingSize instance) =>
    <String, dynamic>{
      'id': instance.id,
      'index': instance.index,
      'nutrition_multiplier': instance.nutritionMultiplier,
      'unit': instance.unit,
      'value': instance.value,
    };
