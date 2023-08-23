// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountData _$$_AccountDataFromJson(Map json) => _$_AccountData(
      uid: json['uid'] as String,
      username: json['username'] as String,
      nutrients: NutrientGoals.fromJson(
          Map<String, Object?>.from(json['nutrients'] as Map)),
      mealNames: (json['meal_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_AccountDataToJson(_$_AccountData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'nutrients': instance.nutrients.toJson(),
      'meal_names': instance.mealNames,
    };
