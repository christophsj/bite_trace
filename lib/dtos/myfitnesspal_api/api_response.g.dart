// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse _$$_ApiResponseFromJson(Map json) => _$_ApiResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => FoodApiItem.fromJson(Map<String, Object?>.from(e as Map)))
          .toList(),
      totalResultsCount: json['totalResultsCount'] as int,
    );

Map<String, dynamic> _$$_ApiResponseToJson(_$_ApiResponse instance) =>
    <String, dynamic>{
      'items': instance.items.map((e) => e.toJson()).toList(),
      'totalResultsCount': instance.totalResultsCount,
    };
