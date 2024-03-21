// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodResponseImpl _$$FoodResponseImplFromJson(Map json) => _$FoodResponseImpl(
      countryCode: json['country_code'] as String?,
      deleted: json['deleted'] as bool,
      description: json['description'] as String,
      id: json['id'] as int,
      nutritionalContents: NutritionalContentsDto.fromJson(
          Map<String, Object?>.from(json['nutritional_contents'] as Map)),
      public: json['public'] as bool,
      servingSizes: (json['serving_sizes'] as List<dynamic>)
          .map((e) =>
              ServingSizeDto.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      type: json['type'] as String?,
      userId: json['user_id'] as String?,
      verified: json['verified'] as bool,
      version: json['version'] as String?,
      brandName: json['brand_name'] as String?,
    );

Map<String, dynamic> _$$FoodResponseImplToJson(_$FoodResponseImpl instance) =>
    <String, dynamic>{
      'country_code': instance.countryCode,
      'deleted': instance.deleted,
      'description': instance.description,
      'id': instance.id,
      'nutritional_contents': instance.nutritionalContents.toJson(),
      'public': instance.public,
      'serving_sizes': instance.servingSizes.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'user_id': instance.userId,
      'verified': instance.verified,
      'version': instance.version,
      'brand_name': instance.brandName,
    };
