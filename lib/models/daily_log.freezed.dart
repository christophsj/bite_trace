// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyLog _$DailyLogFromJson(Map<String, dynamic> json) {
  return _DailyLog.fromJson(json);
}

/// @nodoc
mixin _$DailyLog {
  @JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
  DateTime get day => throw _privateConstructorUsedError;
  Map<String, Meal> get meals => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
  List<Meal> get sortedMeals => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyLogCopyWith<DailyLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyLogCopyWith<$Res> {
  factory $DailyLogCopyWith(DailyLog value, $Res Function(DailyLog) then) =
      _$DailyLogCopyWithImpl<$Res, DailyLog>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
      DateTime day,
      Map<String, Meal> meals,
      @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
      List<Meal> sortedMeals,
      String id});
}

/// @nodoc
class _$DailyLogCopyWithImpl<$Res, $Val extends DailyLog>
    implements $DailyLogCopyWith<$Res> {
  _$DailyLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? meals = null,
    Object? sortedMeals = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as Map<String, Meal>,
      sortedMeals: null == sortedMeals
          ? _value.sortedMeals
          : sortedMeals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DailyLogCopyWith<$Res> implements $DailyLogCopyWith<$Res> {
  factory _$$_DailyLogCopyWith(
          _$_DailyLog value, $Res Function(_$_DailyLog) then) =
      __$$_DailyLogCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
      DateTime day,
      Map<String, Meal> meals,
      @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
      List<Meal> sortedMeals,
      String id});
}

/// @nodoc
class __$$_DailyLogCopyWithImpl<$Res>
    extends _$DailyLogCopyWithImpl<$Res, _$_DailyLog>
    implements _$$_DailyLogCopyWith<$Res> {
  __$$_DailyLogCopyWithImpl(
      _$_DailyLog _value, $Res Function(_$_DailyLog) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? meals = null,
    Object? sortedMeals = null,
    Object? id = null,
  }) {
    return _then(_$_DailyLog(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as DateTime,
      meals: null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as Map<String, Meal>,
      sortedMeals: null == sortedMeals
          ? _value._sortedMeals
          : sortedMeals // ignore: cast_nullable_to_non_nullable
              as List<Meal>,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DailyLog extends _DailyLog with DiagnosticableTreeMixin {
  const _$_DailyLog(
      {@JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
      required this.day,
      required final Map<String, Meal> meals,
      @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
      required final List<Meal> sortedMeals,
      required this.id})
      : _meals = meals,
        _sortedMeals = sortedMeals,
        super._();

  factory _$_DailyLog.fromJson(Map<String, dynamic> json) =>
      _$$_DailyLogFromJson(json);

  @override
  @JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
  final DateTime day;
  final Map<String, Meal> _meals;
  @override
  Map<String, Meal> get meals {
    if (_meals is EqualUnmodifiableMapView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meals);
  }

  final List<Meal> _sortedMeals;
  @override
  @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
  List<Meal> get sortedMeals {
    if (_sortedMeals is EqualUnmodifiableListView) return _sortedMeals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sortedMeals);
  }

  @override
  final String id;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DailyLog(day: $day, meals: $meals, sortedMeals: $sortedMeals, id: $id)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DailyLog'))
      ..add(DiagnosticsProperty('day', day))
      ..add(DiagnosticsProperty('meals', meals))
      ..add(DiagnosticsProperty('sortedMeals', sortedMeals))
      ..add(DiagnosticsProperty('id', id));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DailyLog &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._meals, _meals) &&
            const DeepCollectionEquality()
                .equals(other._sortedMeals, _sortedMeals) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      day,
      const DeepCollectionEquality().hash(_meals),
      const DeepCollectionEquality().hash(_sortedMeals),
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DailyLogCopyWith<_$_DailyLog> get copyWith =>
      __$$_DailyLogCopyWithImpl<_$_DailyLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DailyLogToJson(
      this,
    );
  }
}

abstract class _DailyLog extends DailyLog {
  const factory _DailyLog(
      {@JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
      required final DateTime day,
      required final Map<String, Meal> meals,
      @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
      required final List<Meal> sortedMeals,
      required final String id}) = _$_DailyLog;
  const _DailyLog._() : super._();

  factory _DailyLog.fromJson(Map<String, dynamic> json) = _$_DailyLog.fromJson;

  @override
  @JsonKey(fromJson: DailyLog.dtFromJson, toJson: DailyLog.dtToJson)
  DateTime get day;
  @override
  Map<String, Meal> get meals;
  @override
  @JsonKey(includeToJson: false, readValue: DailyLog.getSortedMeals)
  List<Meal> get sortedMeals;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DailyLogCopyWith<_$_DailyLog> get copyWith =>
      throw _privateConstructorUsedError;
}
