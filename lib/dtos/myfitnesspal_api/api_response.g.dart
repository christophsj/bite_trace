// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map json) => _$ApiResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => FoodApiItem.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
    };
