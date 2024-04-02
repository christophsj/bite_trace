// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'energy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnergyImpl _$$EnergyImplFromJson(Map json) => _$EnergyImpl(
      unit: json['unit'] as String,
      value: (json['value'] as num).toDouble(),
    );

Map<String, dynamic> _$$EnergyImplToJson(_$EnergyImpl instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.value,
    };
