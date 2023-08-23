// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'energy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Energy _$EnergyFromJson(Map<String, dynamic> json) {
  return _Energy.fromJson(json);
}

/// @nodoc
mixin _$Energy {
  String get unit => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EnergyCopyWith<Energy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnergyCopyWith<$Res> {
  factory $EnergyCopyWith(Energy value, $Res Function(Energy) then) =
      _$EnergyCopyWithImpl<$Res, Energy>;
  @useResult
  $Res call({String unit, double value});
}

/// @nodoc
class _$EnergyCopyWithImpl<$Res, $Val extends Energy>
    implements $EnergyCopyWith<$Res> {
  _$EnergyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EnergyCopyWith<$Res> implements $EnergyCopyWith<$Res> {
  factory _$$_EnergyCopyWith(_$_Energy value, $Res Function(_$_Energy) then) =
      __$$_EnergyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String unit, double value});
}

/// @nodoc
class __$$_EnergyCopyWithImpl<$Res>
    extends _$EnergyCopyWithImpl<$Res, _$_Energy>
    implements _$$_EnergyCopyWith<$Res> {
  __$$_EnergyCopyWithImpl(_$_Energy _value, $Res Function(_$_Energy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_$_Energy(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Energy implements _Energy {
  const _$_Energy({required this.unit, required this.value});

  factory _$_Energy.fromJson(Map<String, dynamic> json) =>
      _$$_EnergyFromJson(json);

  @override
  final String unit;
  @override
  final double value;

  @override
  String toString() {
    return 'Energy(unit: $unit, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Energy &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, unit, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnergyCopyWith<_$_Energy> get copyWith =>
      __$$_EnergyCopyWithImpl<_$_Energy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EnergyToJson(
      this,
    );
  }
}

abstract class _Energy implements Energy {
  const factory _Energy(
      {required final String unit, required final double value}) = _$_Energy;

  factory _Energy.fromJson(Map<String, dynamic> json) = _$_Energy.fromJson;

  @override
  String get unit;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_EnergyCopyWith<_$_Energy> get copyWith =>
      throw _privateConstructorUsedError;
}
