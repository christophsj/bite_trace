// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodResponse _$FoodResponseFromJson(Map<String, dynamic> json) {
  return _FoodResponse.fromJson(json);
}

/// @nodoc
mixin _$FoodResponse {
  String? get countryCode => throw _privateConstructorUsedError;
  bool get deleted => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  NutritionalContentsDto get nutritionalContents =>
      throw _privateConstructorUsedError;
  bool get public => throw _privateConstructorUsedError;
  List<ServingSizeDto> get servingSizes => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  String? get version => throw _privateConstructorUsedError;
  String? get brandName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodResponseCopyWith<FoodResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodResponseCopyWith<$Res> {
  factory $FoodResponseCopyWith(
          FoodResponse value, $Res Function(FoodResponse) then) =
      _$FoodResponseCopyWithImpl<$Res, FoodResponse>;
  @useResult
  $Res call(
      {String? countryCode,
      bool deleted,
      String description,
      int id,
      NutritionalContentsDto nutritionalContents,
      bool public,
      List<ServingSizeDto> servingSizes,
      String? type,
      String? userId,
      bool verified,
      String? version,
      String? brandName});

  $NutritionalContentsDtoCopyWith<$Res> get nutritionalContents;
}

/// @nodoc
class _$FoodResponseCopyWithImpl<$Res, $Val extends FoodResponse>
    implements $FoodResponseCopyWith<$Res> {
  _$FoodResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? deleted = null,
    Object? description = null,
    Object? id = null,
    Object? nutritionalContents = null,
    Object? public = null,
    Object? servingSizes = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? verified = null,
    Object? version = freezed,
    Object? brandName = freezed,
  }) {
    return _then(_value.copyWith(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as NutritionalContentsDto,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSizes: null == servingSizes
          ? _value.servingSizes
          : servingSizes // ignore: cast_nullable_to_non_nullable
              as List<ServingSizeDto>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NutritionalContentsDtoCopyWith<$Res> get nutritionalContents {
    return $NutritionalContentsDtoCopyWith<$Res>(_value.nutritionalContents,
        (value) {
      return _then(_value.copyWith(nutritionalContents: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodResponseImplCopyWith<$Res>
    implements $FoodResponseCopyWith<$Res> {
  factory _$$FoodResponseImplCopyWith(
          _$FoodResponseImpl value, $Res Function(_$FoodResponseImpl) then) =
      __$$FoodResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? countryCode,
      bool deleted,
      String description,
      int id,
      NutritionalContentsDto nutritionalContents,
      bool public,
      List<ServingSizeDto> servingSizes,
      String? type,
      String? userId,
      bool verified,
      String? version,
      String? brandName});

  @override
  $NutritionalContentsDtoCopyWith<$Res> get nutritionalContents;
}

/// @nodoc
class __$$FoodResponseImplCopyWithImpl<$Res>
    extends _$FoodResponseCopyWithImpl<$Res, _$FoodResponseImpl>
    implements _$$FoodResponseImplCopyWith<$Res> {
  __$$FoodResponseImplCopyWithImpl(
      _$FoodResponseImpl _value, $Res Function(_$FoodResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = freezed,
    Object? deleted = null,
    Object? description = null,
    Object? id = null,
    Object? nutritionalContents = null,
    Object? public = null,
    Object? servingSizes = null,
    Object? type = freezed,
    Object? userId = freezed,
    Object? verified = null,
    Object? version = freezed,
    Object? brandName = freezed,
  }) {
    return _then(_$FoodResponseImpl(
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      deleted: null == deleted
          ? _value.deleted
          : deleted // ignore: cast_nullable_to_non_nullable
              as bool,
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
              as NutritionalContentsDto,
      public: null == public
          ? _value.public
          : public // ignore: cast_nullable_to_non_nullable
              as bool,
      servingSizes: null == servingSizes
          ? _value._servingSizes
          : servingSizes // ignore: cast_nullable_to_non_nullable
              as List<ServingSizeDto>,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      version: freezed == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String?,
      brandName: freezed == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodResponseImpl implements _FoodResponse {
  const _$FoodResponseImpl(
      {this.countryCode,
      required this.deleted,
      required this.description,
      required this.id,
      required this.nutritionalContents,
      required this.public,
      required final List<ServingSizeDto> servingSizes,
      this.type,
      this.userId,
      required this.verified,
      this.version,
      this.brandName})
      : _servingSizes = servingSizes;

  factory _$FoodResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodResponseImplFromJson(json);

  @override
  final String? countryCode;
  @override
  final bool deleted;
  @override
  final String description;
  @override
  final int id;
  @override
  final NutritionalContentsDto nutritionalContents;
  @override
  final bool public;
  final List<ServingSizeDto> _servingSizes;
  @override
  List<ServingSizeDto> get servingSizes {
    if (_servingSizes is EqualUnmodifiableListView) return _servingSizes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingSizes);
  }

  @override
  final String? type;
  @override
  final String? userId;
  @override
  final bool verified;
  @override
  final String? version;
  @override
  final String? brandName;

  @override
  String toString() {
    return 'FoodResponse(countryCode: $countryCode, deleted: $deleted, description: $description, id: $id, nutritionalContents: $nutritionalContents, public: $public, servingSizes: $servingSizes, type: $type, userId: $userId, verified: $verified, version: $version, brandName: $brandName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodResponseImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.deleted, deleted) || other.deleted == deleted) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutritionalContents, nutritionalContents) ||
                other.nutritionalContents == nutritionalContents) &&
            (identical(other.public, public) || other.public == public) &&
            const DeepCollectionEquality()
                .equals(other._servingSizes, _servingSizes) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryCode,
      deleted,
      description,
      id,
      nutritionalContents,
      public,
      const DeepCollectionEquality().hash(_servingSizes),
      type,
      userId,
      verified,
      version,
      brandName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodResponseImplCopyWith<_$FoodResponseImpl> get copyWith =>
      __$$FoodResponseImplCopyWithImpl<_$FoodResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodResponseImplToJson(
      this,
    );
  }
}

abstract class _FoodResponse implements FoodResponse {
  const factory _FoodResponse(
      {final String? countryCode,
      required final bool deleted,
      required final String description,
      required final int id,
      required final NutritionalContentsDto nutritionalContents,
      required final bool public,
      required final List<ServingSizeDto> servingSizes,
      final String? type,
      final String? userId,
      required final bool verified,
      final String? version,
      final String? brandName}) = _$FoodResponseImpl;

  factory _FoodResponse.fromJson(Map<String, dynamic> json) =
      _$FoodResponseImpl.fromJson;

  @override
  String? get countryCode;
  @override
  bool get deleted;
  @override
  String get description;
  @override
  int get id;
  @override
  NutritionalContentsDto get nutritionalContents;
  @override
  bool get public;
  @override
  List<ServingSizeDto> get servingSizes;
  @override
  String? get type;
  @override
  String? get userId;
  @override
  bool get verified;
  @override
  String? get version;
  @override
  String? get brandName;
  @override
  @JsonKey(ignore: true)
  _$$FoodResponseImplCopyWith<_$FoodResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
