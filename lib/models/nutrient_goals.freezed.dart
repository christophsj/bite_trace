// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NutrientGoals _$NutrientGoalsFromJson(Map<String, dynamic> json) {
  return _NutrientGoals.fromJson(json);
}

/// @nodoc
mixin _$NutrientGoals {
  int get calories => throw _privateConstructorUsedError;
  int get carbPerc => throw _privateConstructorUsedError;
  int get proteinPerc => throw _privateConstructorUsedError;
  int get fatPerc => throw _privateConstructorUsedError;
  Nutrients? get otherNutrients => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NutrientGoalsCopyWith<NutrientGoals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientGoalsCopyWith<$Res> {
  factory $NutrientGoalsCopyWith(
          NutrientGoals value, $Res Function(NutrientGoals) then) =
      _$NutrientGoalsCopyWithImpl<$Res, NutrientGoals>;
  @useResult
  $Res call(
      {int calories,
      int carbPerc,
      int proteinPerc,
      int fatPerc,
      Nutrients? otherNutrients});

  $NutrientsCopyWith<$Res>? get otherNutrients;
}

/// @nodoc
class _$NutrientGoalsCopyWithImpl<$Res, $Val extends NutrientGoals>
    implements $NutrientGoalsCopyWith<$Res> {
  _$NutrientGoalsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? carbPerc = null,
    Object? proteinPerc = null,
    Object? fatPerc = null,
    Object? otherNutrients = freezed,
  }) {
    return _then(_value.copyWith(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      carbPerc: null == carbPerc
          ? _value.carbPerc
          : carbPerc // ignore: cast_nullable_to_non_nullable
              as int,
      proteinPerc: null == proteinPerc
          ? _value.proteinPerc
          : proteinPerc // ignore: cast_nullable_to_non_nullable
              as int,
      fatPerc: null == fatPerc
          ? _value.fatPerc
          : fatPerc // ignore: cast_nullable_to_non_nullable
              as int,
      otherNutrients: freezed == otherNutrients
          ? _value.otherNutrients
          : otherNutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NutrientsCopyWith<$Res>? get otherNutrients {
    if (_value.otherNutrients == null) {
      return null;
    }

    return $NutrientsCopyWith<$Res>(_value.otherNutrients!, (value) {
      return _then(_value.copyWith(otherNutrients: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NutrientGoalsCopyWith<$Res>
    implements $NutrientGoalsCopyWith<$Res> {
  factory _$$_NutrientGoalsCopyWith(
          _$_NutrientGoals value, $Res Function(_$_NutrientGoals) then) =
      __$$_NutrientGoalsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int calories,
      int carbPerc,
      int proteinPerc,
      int fatPerc,
      Nutrients? otherNutrients});

  @override
  $NutrientsCopyWith<$Res>? get otherNutrients;
}

/// @nodoc
class __$$_NutrientGoalsCopyWithImpl<$Res>
    extends _$NutrientGoalsCopyWithImpl<$Res, _$_NutrientGoals>
    implements _$$_NutrientGoalsCopyWith<$Res> {
  __$$_NutrientGoalsCopyWithImpl(
      _$_NutrientGoals _value, $Res Function(_$_NutrientGoals) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? calories = null,
    Object? carbPerc = null,
    Object? proteinPerc = null,
    Object? fatPerc = null,
    Object? otherNutrients = freezed,
  }) {
    return _then(_$_NutrientGoals(
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as int,
      carbPerc: null == carbPerc
          ? _value.carbPerc
          : carbPerc // ignore: cast_nullable_to_non_nullable
              as int,
      proteinPerc: null == proteinPerc
          ? _value.proteinPerc
          : proteinPerc // ignore: cast_nullable_to_non_nullable
              as int,
      fatPerc: null == fatPerc
          ? _value.fatPerc
          : fatPerc // ignore: cast_nullable_to_non_nullable
              as int,
      otherNutrients: freezed == otherNutrients
          ? _value.otherNutrients
          : otherNutrients // ignore: cast_nullable_to_non_nullable
              as Nutrients?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NutrientGoals extends _NutrientGoals with DiagnosticableTreeMixin {
  const _$_NutrientGoals(
      {required this.calories,
      required this.carbPerc,
      required this.proteinPerc,
      required this.fatPerc,
      this.otherNutrients})
      : super._();

  factory _$_NutrientGoals.fromJson(Map<String, dynamic> json) =>
      _$$_NutrientGoalsFromJson(json);

  @override
  final int calories;
  @override
  final int carbPerc;
  @override
  final int proteinPerc;
  @override
  final int fatPerc;
  @override
  final Nutrients? otherNutrients;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NutrientGoals(calories: $calories, carbPerc: $carbPerc, proteinPerc: $proteinPerc, fatPerc: $fatPerc, otherNutrients: $otherNutrients)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NutrientGoals'))
      ..add(DiagnosticsProperty('calories', calories))
      ..add(DiagnosticsProperty('carbPerc', carbPerc))
      ..add(DiagnosticsProperty('proteinPerc', proteinPerc))
      ..add(DiagnosticsProperty('fatPerc', fatPerc))
      ..add(DiagnosticsProperty('otherNutrients', otherNutrients));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NutrientGoals &&
            (identical(other.calories, calories) ||
                other.calories == calories) &&
            (identical(other.carbPerc, carbPerc) ||
                other.carbPerc == carbPerc) &&
            (identical(other.proteinPerc, proteinPerc) ||
                other.proteinPerc == proteinPerc) &&
            (identical(other.fatPerc, fatPerc) || other.fatPerc == fatPerc) &&
            (identical(other.otherNutrients, otherNutrients) ||
                other.otherNutrients == otherNutrients));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, calories, carbPerc, proteinPerc, fatPerc, otherNutrients);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NutrientGoalsCopyWith<_$_NutrientGoals> get copyWith =>
      __$$_NutrientGoalsCopyWithImpl<_$_NutrientGoals>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NutrientGoalsToJson(
      this,
    );
  }
}

abstract class _NutrientGoals extends NutrientGoals {
  const factory _NutrientGoals(
      {required final int calories,
      required final int carbPerc,
      required final int proteinPerc,
      required final int fatPerc,
      final Nutrients? otherNutrients}) = _$_NutrientGoals;
  const _NutrientGoals._() : super._();

  factory _NutrientGoals.fromJson(Map<String, dynamic> json) =
      _$_NutrientGoals.fromJson;

  @override
  int get calories;
  @override
  int get carbPerc;
  @override
  int get proteinPerc;
  @override
  int get fatPerc;
  @override
  Nutrients? get otherNutrients;
  @override
  @JsonKey(ignore: true)
  _$$_NutrientGoalsCopyWith<_$_NutrientGoals> get copyWith =>
      throw _privateConstructorUsedError;
}
