// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'serving_size.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ServingSizeDto _$ServingSizeDtoFromJson(Map<String, dynamic> json) {
  return _ServingSize.fromJson(json);
}

/// @nodoc
mixin _$ServingSizeDto {
  String get id => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  double get nutritionMultiplier => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServingSizeDtoCopyWith<ServingSizeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServingSizeDtoCopyWith<$Res> {
  factory $ServingSizeDtoCopyWith(
          ServingSizeDto value, $Res Function(ServingSizeDto) then) =
      _$ServingSizeDtoCopyWithImpl<$Res, ServingSizeDto>;
  @useResult
  $Res call(
      {String id,
      int index,
      double nutritionMultiplier,
      String unit,
      double value});
}

/// @nodoc
class _$ServingSizeDtoCopyWithImpl<$Res, $Val extends ServingSizeDto>
    implements $ServingSizeDtoCopyWith<$Res> {
  _$ServingSizeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? nutritionMultiplier = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      nutritionMultiplier: null == nutritionMultiplier
          ? _value.nutritionMultiplier
          : nutritionMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_ServingSizeCopyWith<$Res>
    implements $ServingSizeDtoCopyWith<$Res> {
  factory _$$_ServingSizeCopyWith(
          _$_ServingSize value, $Res Function(_$_ServingSize) then) =
      __$$_ServingSizeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int index,
      double nutritionMultiplier,
      String unit,
      double value});
}

/// @nodoc
class __$$_ServingSizeCopyWithImpl<$Res>
    extends _$ServingSizeDtoCopyWithImpl<$Res, _$_ServingSize>
    implements _$$_ServingSizeCopyWith<$Res> {
  __$$_ServingSizeCopyWithImpl(
      _$_ServingSize _value, $Res Function(_$_ServingSize) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? index = null,
    Object? nutritionMultiplier = null,
    Object? unit = null,
    Object? value = null,
  }) {
    return _then(_$_ServingSize(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      nutritionMultiplier: null == nutritionMultiplier
          ? _value.nutritionMultiplier
          : nutritionMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
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
class _$_ServingSize implements _ServingSize {
  const _$_ServingSize(
      {required this.id,
      required this.index,
      required this.nutritionMultiplier,
      required this.unit,
      required this.value});

  factory _$_ServingSize.fromJson(Map<String, dynamic> json) =>
      _$$_ServingSizeFromJson(json);

  @override
  final String id;
  @override
  final int index;
  @override
  final double nutritionMultiplier;
  @override
  final String unit;
  @override
  final double value;

  @override
  String toString() {
    return 'ServingSizeDto(id: $id, index: $index, nutritionMultiplier: $nutritionMultiplier, unit: $unit, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServingSize &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.nutritionMultiplier, nutritionMultiplier) ||
                other.nutritionMultiplier == nutritionMultiplier) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, index, nutritionMultiplier, unit, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServingSizeCopyWith<_$_ServingSize> get copyWith =>
      __$$_ServingSizeCopyWithImpl<_$_ServingSize>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServingSizeToJson(
      this,
    );
  }
}

abstract class _ServingSize implements ServingSizeDto {
  const factory _ServingSize(
      {required final String id,
      required final int index,
      required final double nutritionMultiplier,
      required final String unit,
      required final double value}) = _$_ServingSize;

  factory _ServingSize.fromJson(Map<String, dynamic> json) =
      _$_ServingSize.fromJson;

  @override
  String get id;
  @override
  int get index;
  @override
  double get nutritionMultiplier;
  @override
  String get unit;
  @override
  double get value;
  @override
  @JsonKey(ignore: true)
  _$$_ServingSizeCopyWith<_$_ServingSize> get copyWith =>
      throw _privateConstructorUsedError;
}
