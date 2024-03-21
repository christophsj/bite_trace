// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodApiItem _$FoodApiItemFromJson(Map<String, dynamic> json) {
  return _FoodApiItem.fromJson(json);
}

/// @nodoc
mixin _$FoodApiItem {
  FoodResponse get item => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodApiItemCopyWith<FoodApiItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodApiItemCopyWith<$Res> {
  factory $FoodApiItemCopyWith(
          FoodApiItem value, $Res Function(FoodApiItem) then) =
      _$FoodApiItemCopyWithImpl<$Res, FoodApiItem>;
  @useResult
  $Res call({FoodResponse item, List<String> tags, String type});

  $FoodResponseCopyWith<$Res> get item;
}

/// @nodoc
class _$FoodApiItemCopyWithImpl<$Res, $Val extends FoodApiItem>
    implements $FoodApiItemCopyWith<$Res> {
  _$FoodApiItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? tags = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FoodResponse,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodResponseCopyWith<$Res> get item {
    return $FoodResponseCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodApiItemImplCopyWith<$Res>
    implements $FoodApiItemCopyWith<$Res> {
  factory _$$FoodApiItemImplCopyWith(
          _$FoodApiItemImpl value, $Res Function(_$FoodApiItemImpl) then) =
      __$$FoodApiItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FoodResponse item, List<String> tags, String type});

  @override
  $FoodResponseCopyWith<$Res> get item;
}

/// @nodoc
class __$$FoodApiItemImplCopyWithImpl<$Res>
    extends _$FoodApiItemCopyWithImpl<$Res, _$FoodApiItemImpl>
    implements _$$FoodApiItemImplCopyWith<$Res> {
  __$$FoodApiItemImplCopyWithImpl(
      _$FoodApiItemImpl _value, $Res Function(_$FoodApiItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? tags = null,
    Object? type = null,
  }) {
    return _then(_$FoodApiItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FoodResponse,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodApiItemImpl implements _FoodApiItem {
  const _$FoodApiItemImpl(
      {required this.item,
      required final List<String> tags,
      required this.type})
      : _tags = tags;

  factory _$FoodApiItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodApiItemImplFromJson(json);

  @override
  final FoodResponse item;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String type;

  @override
  String toString() {
    return 'FoodApiItem(item: $item, tags: $tags, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodApiItemImpl &&
            (identical(other.item, item) || other.item == item) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, item, const DeepCollectionEquality().hash(_tags), type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodApiItemImplCopyWith<_$FoodApiItemImpl> get copyWith =>
      __$$FoodApiItemImplCopyWithImpl<_$FoodApiItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodApiItemImplToJson(
      this,
    );
  }
}

abstract class _FoodApiItem implements FoodApiItem {
  const factory _FoodApiItem(
      {required final FoodResponse item,
      required final List<String> tags,
      required final String type}) = _$FoodApiItemImpl;

  factory _FoodApiItem.fromJson(Map<String, dynamic> json) =
      _$FoodApiItemImpl.fromJson;

  @override
  FoodResponse get item;
  @override
  List<String> get tags;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$FoodApiItemImplCopyWith<_$FoodApiItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
