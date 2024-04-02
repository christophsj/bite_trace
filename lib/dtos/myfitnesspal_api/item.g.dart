// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodApiItemImpl _$$FoodApiItemImplFromJson(Map json) => _$FoodApiItemImpl(
      item:
          FoodResponse.fromJson(Map<String, Object?>.from(json['item'] as Map)),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      type: json['type'] as String,
    );

Map<String, dynamic> _$$FoodApiItemImplToJson(_$FoodApiItemImpl instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'tags': instance.tags,
      'type': instance.type,
    };
