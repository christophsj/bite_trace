// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  String? get countryCode => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  Nutrients get nutritionalContents => throw _privateConstructorUsedError;
  int get chosenServingSize => throw _privateConstructorUsedError;
  List<ServingSize> get servingSizes => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {String? countryCode,
      String description,
      int id,
      Nutrients nutritionalContents,
      int chosenServingSize,
      List<ServingSize> servingSizes,
      String? type,
      bool verified,
      String? brandName});

  $NutrientsCopyWith<$Res> get nutritionalContents;
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? description = null,
    Object? id = null,
    Object? nutritionalContents = null,
    Object? chosenServingSize = null,
    Object? servingSizes = null,
    Object? type = freezed,
    Object? verified = null,
    Object? brandName = freezed,
  }) {
    return _then(_value.copyWith(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nutritionalContents: null == nutritionalContents
          ? _value.nutritionalContents
          : nutritionalContents // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      chosenServingSize: null == chosenServingSize
          ? _value.chosenServingSize
          : chosenServingSize // ignore: cast_nullable_to_non_nullable
              as int,
      servingSizes: null == servingSizes
          ? _value.servingSizes
          : servingSizes // ignore: cast_nullable_to_non_nullable
              as List<ServingSize>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NutrientsCopyWith<$Res> get nutritionalContents {
    return $NutrientsCopyWith<$Res>(_value.nutritionalContents, (value) {
      return _then(_value.copyWith(nutritionalContents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$_FoodCopyWith(_$_Food value, $Res Function(_$_Food) then) =
      __$$_FoodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? countryCode,
      String description,
      int id,
      Nutrients nutritionalContents,
      int chosenServingSize,
      List<ServingSize> servingSizes,
      String? type,
      bool verified,
      String? brandName});

  @override
  $NutrientsCopyWith<$Res> get nutritionalContents;
}

/// @nodoc
class __$$_FoodCopyWithImpl<$Res> extends _$FoodCopyWithImpl<$Res, _$_Food>
    implements _$$_FoodCopyWith<$Res> {
  __$$_FoodCopyWithImpl(_$_Food _value, $Res Function(_$_Food) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? description = null,
    Object? id = null,
    Object? nutritionalContents = null,
    Object? chosenServingSize = null,
    Object? servingSizes = null,
    Object? type = freezed,
    Object? verified = null,
    Object? brandName = freezed,
  }) {
    return _then(_$_Food(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      nutritionalContents: null == nutritionalContents
          ? _value.nutritionalContents
          : nutritionalContents // ignore: cast_nullable_to_non_nullable
              as Nutrients,
      chosenServingSize: null == chosenServingSize
          ? _value.chosenServingSize
          : chosenServingSize // ignore: cast_nullable_to_non_nullable
              as int,
      servingSizes: null == servingSizes
          ? _value._servingSizes
          : servingSizes // ignore: cast_nullable_to_non_nullable
              as List<ServingSize>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Food with DiagnosticableTreeMixin implements _Food {
  const _$_Food(
      {this.countryCode,
      required this.description,
      required this.id,
      required this.nutritionalContents,
      required this.chosenServingSize,
      required final List<ServingSize> servingSizes,
      this.type,
      required this.verified,
      this.brandName})
      : _servingSizes = servingSizes;

  factory _$_Food.fromJson(Map<String, dynamic> json) => _$$_FoodFromJson(json);

  @override
  final String? countryCode;
  @override
  final String description;
  @override
  final int id;
  @override
  final Nutrients nutritionalContents;
  @override
  final int chosenServingSize;
  final List<ServingSize> _servingSizes;
  @override
  List<ServingSize> get servingSizes {
    if (_servingSizes is EqualUnmodifiableListView) return _servingSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingSizes);
  }

  @override
  final String? type;
  @override
  final bool verified;
  @override
  final String? brandName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Food(countryCode: $countryCode, description: $description, id: $id, nutritionalContents: $nutritionalContents, chosenServingSize: $chosenServingSize, servingSizes: $servingSizes, type: $type, verified: $verified, brandName: $brandName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Food'))
      ..add(DiagnosticsProperty('countryCode', countryCode))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('nutritionalContents', nutritionalContents))
      ..add(DiagnosticsProperty('chosenServingSize', chosenServingSize))
      ..add(DiagnosticsProperty('servingSizes', servingSizes))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('verified', verified))
      ..add(DiagnosticsProperty('brandName', brandName));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Food &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutritionalContents, nutritionalContents) ||
                other.nutritionalContents == nutritionalContents) &&
            (identical(other.chosenServingSize, chosenServingSize) ||
                other.chosenServingSize == chosenServingSize) &&
            const DeepCollectionEquality()
                .equals(other._servingSizes, _servingSizes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryCode,
      description,
      id,
      nutritionalContents,
      chosenServingSize,
      const DeepCollectionEquality().hash(_servingSizes),
      type,
      verified,
      brandName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoodCopyWith<_$_Food> get copyWith =>
      __$$_FoodCopyWithImpl<_$_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FoodToJson(
      this,
    );
  }
}

abstract class _Food implements Food {
  const factory _Food(
      {final String? countryCode,
      required final String description,
      required final int id,
      required final Nutrients nutritionalContents,
      required final int chosenServingSize,
      required final List<ServingSize> servingSizes,
      final String? type,
      required final bool verified,
      final String? brandName}) = _$_Food;

  factory _Food.fromJson(Map<String, dynamic> json) = _$_Food.fromJson;

  @override
  String? get countryCode;
  @override
  String get description;
  @override
  int get id;
  @override
  Nutrients get nutritionalContents;
  @override
  int get chosenServingSize;
  @override
  List<ServingSize> get servingSizes;
  @override
  String? get type;
  @override
  bool get verified;
  @override
  String? get brandName;
  @override
  @JsonKey(ignore: true)
  _$$_FoodCopyWith<_$_Food> get copyWith => throw _privateConstructorUsedError;
}
