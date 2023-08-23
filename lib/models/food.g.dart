// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Food _$$_FoodFromJson(Map json) => _$_Food(
      countryCode: json['country_code'] as String?,
      description: json['description'] as String,
      id: json['id'] as int,
      nutritionalContents: Nutrients.fromJson(
          Map<String, Object?>.from(json['nutritional_contents'] as Map)),
      chosenServingSize: json['chosen_serving_size'] as int,
      servingSizes: (json['serving_sizes'] as List<dynamic>)
          .map((e) => ServingSize.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      type: json['type'] as String?,
      verified: json['verified'] as bool,
      brandName: json['brand_name'] as String?,
    );

Map<String, dynamic> _$$_FoodToJson(_$_Food instance) => <String, dynamic>{
      'country_code': instance.countryCode,
      'description': instance.description,
      'id': instance.id,
      'nutritional_contents': instance.nutritionalContents.toJson(),
      'chosen_serving_size': instance.chosenServingSize,
      'serving_sizes': instance.servingSizes.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'verified': instance.verified,
      'brand_name': instance.brandName,
    };
