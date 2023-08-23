// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountData _$AccountDataFromJson(Map<String, dynamic> json) {
  return _AccountData.fromJson(json);
}

/// @nodoc
mixin _$AccountData {
  String get uid => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  NutrientGoals get nutrients => throw _privateConstructorUsedError;
  List<String>? get mealNames => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountDataCopyWith<AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountDataCopyWith<$Res> {
  factory $AccountDataCopyWith(
          AccountData value, $Res Function(AccountData) then) =
      _$AccountDataCopyWithImpl<$Res, AccountData>;
  @useResult
  $Res call(
      {String uid,
      String username,
      NutrientGoals nutrients,
      List<String>? mealNames});

  $NutrientGoalsCopyWith<$Res> get nutrients;
}

/// @nodoc
class _$AccountDataCopyWithImpl<$Res, $Val extends AccountData>
    implements $AccountDataCopyWith<$Res> {
  _$AccountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? nutrients = null,
    Object? mealNames = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as NutrientGoals,
      mealNames: freezed == mealNames
          ? _value.mealNames
          : mealNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NutrientGoalsCopyWith<$Res> get nutrients {
    return $NutrientGoalsCopyWith<$Res>(_value.nutrients, (value) {
      return _then(_value.copyWith(nutrients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AccountDataCopyWith<$Res>
    implements $AccountDataCopyWith<$Res> {
  factory _$$_AccountDataCopyWith(
          _$_AccountData value, $Res Function(_$_AccountData) then) =
      __$$_AccountDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String username,
      NutrientGoals nutrients,
      List<String>? mealNames});

  @override
  $NutrientGoalsCopyWith<$Res> get nutrients;
}

/// @nodoc
class __$$_AccountDataCopyWithImpl<$Res>
    extends _$AccountDataCopyWithImpl<$Res, _$_AccountData>
    implements _$$_AccountDataCopyWith<$Res> {
  __$$_AccountDataCopyWithImpl(
      _$_AccountData _value, $Res Function(_$_AccountData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = null,
    Object? nutrients = null,
    Object? mealNames = freezed,
  }) {
    return _then(_$_AccountData(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      nutrients: null == nutrients
          ? _value.nutrients
          : nutrients // ignore: cast_nullable_to_non_nullable
              as NutrientGoals,
      mealNames: freezed == mealNames
          ? _value._mealNames
          : mealNames // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountData with DiagnosticableTreeMixin implements _AccountData {
  const _$_AccountData(
      {required this.uid,
      required this.username,
      required this.nutrients,
      required final List<String>? mealNames})
      : _mealNames = mealNames;

  factory _$_AccountData.fromJson(Map<String, dynamic> json) =>
      _$$_AccountDataFromJson(json);

  @override
  final String uid;
  @override
  final String username;
  @override
  final NutrientGoals nutrients;
  final List<String>? _mealNames;
  @override
  List<String>? get mealNames {
    final value = _mealNames;
    if (value == null) return null;
    if (_mealNames is EqualUnmodifiableListView) return _mealNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountData(uid: $uid, username: $username, nutrients: $nutrients, mealNames: $mealNames)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountData'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('nutrients', nutrients))
      ..add(DiagnosticsProperty('mealNames', mealNames));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountData &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.nutrients, nutrients) ||
                other.nutrients == nutrients) &&
            const DeepCollectionEquality()
                .equals(other._mealNames, _mealNames));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, username, nutrients,
      const DeepCollectionEquality().hash(_mealNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountDataCopyWith<_$_AccountData> get copyWith =>
      __$$_AccountDataCopyWithImpl<_$_AccountData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountDataToJson(
      this,
    );
  }
}

abstract class _AccountData implements AccountData {
  const factory _AccountData(
      {required final String uid,
      required final String username,
      required final NutrientGoals nutrients,
      required final List<String>? mealNames}) = _$_AccountData;

  factory _AccountData.fromJson(Map<String, dynamic> json) =
      _$_AccountData.fromJson;

  @override
  String get uid;
  @override
  String get username;
  @override
  NutrientGoals get nutrients;
  @override
  List<String>? get mealNames;
  @override
  @JsonKey(ignore: true)
  _$$_AccountDataCopyWith<_$_AccountData> get copyWith =>
      throw _privateConstructorUsedError;
}
