// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoutineTearOff {
  const _$RoutineTearOff();

  _Routine call(
      {required String id,
      required String smartItemId,
      required String name,
      required DateTime turnOnTime,
      required DateTime turnOffTime,
      required RoutineFrequency frequency,
      required RoutineState state}) {
    return _Routine(
      id: id,
      smartItemId: smartItemId,
      name: name,
      turnOnTime: turnOnTime,
      turnOffTime: turnOffTime,
      frequency: frequency,
      state: state,
    );
  }
}

/// @nodoc
const $Routine = _$RoutineTearOff();

/// @nodoc
mixin _$Routine {
  /// Unique identifier
  String get id => throw _privateConstructorUsedError;

  /// Unique identifier of a [SmartItem]
  String get smartItemId => throw _privateConstructorUsedError;

  /// The routine name
  String get name => throw _privateConstructorUsedError;

  /// Time to turn on the service or device
  DateTime get turnOnTime => throw _privateConstructorUsedError;

  /// Time to turn off the service or device
  DateTime get turnOffTime => throw _privateConstructorUsedError;

  /// Frequency in which this routine is going to be executed
  /// [daily, weekly, monthly]
  RoutineFrequency get frequency => throw _privateConstructorUsedError;

  /// Routine State [disable, enable]
  RoutineState get state => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutineCopyWith<Routine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineCopyWith<$Res> {
  factory $RoutineCopyWith(Routine value, $Res Function(Routine) then) =
      _$RoutineCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String smartItemId,
      String name,
      DateTime turnOnTime,
      DateTime turnOffTime,
      RoutineFrequency frequency,
      RoutineState state});
}

/// @nodoc
class _$RoutineCopyWithImpl<$Res> implements $RoutineCopyWith<$Res> {
  _$RoutineCopyWithImpl(this._value, this._then);

  final Routine _value;
  // ignore: unused_field
  final $Res Function(Routine) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? smartItemId = freezed,
    Object? name = freezed,
    Object? turnOnTime = freezed,
    Object? turnOffTime = freezed,
    Object? frequency = freezed,
    Object? state = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      smartItemId: smartItemId == freezed
          ? _value.smartItemId
          : smartItemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      turnOnTime: turnOnTime == freezed
          ? _value.turnOnTime
          : turnOnTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      turnOffTime: turnOffTime == freezed
          ? _value.turnOffTime
          : turnOffTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RoutineFrequency,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoutineState,
    ));
  }
}

/// @nodoc
abstract class _$RoutineCopyWith<$Res> implements $RoutineCopyWith<$Res> {
  factory _$RoutineCopyWith(_Routine value, $Res Function(_Routine) then) =
      __$RoutineCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String smartItemId,
      String name,
      DateTime turnOnTime,
      DateTime turnOffTime,
      RoutineFrequency frequency,
      RoutineState state});
}

/// @nodoc
class __$RoutineCopyWithImpl<$Res> extends _$RoutineCopyWithImpl<$Res>
    implements _$RoutineCopyWith<$Res> {
  __$RoutineCopyWithImpl(_Routine _value, $Res Function(_Routine) _then)
      : super(_value, (v) => _then(v as _Routine));

  @override
  _Routine get _value => super._value as _Routine;

  @override
  $Res call({
    Object? id = freezed,
    Object? smartItemId = freezed,
    Object? name = freezed,
    Object? turnOnTime = freezed,
    Object? turnOffTime = freezed,
    Object? frequency = freezed,
    Object? state = freezed,
  }) {
    return _then(_Routine(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      smartItemId: smartItemId == freezed
          ? _value.smartItemId
          : smartItemId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      turnOnTime: turnOnTime == freezed
          ? _value.turnOnTime
          : turnOnTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      turnOffTime: turnOffTime == freezed
          ? _value.turnOffTime
          : turnOffTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      frequency: frequency == freezed
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as RoutineFrequency,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RoutineState,
    ));
  }
}

/// @nodoc

class _$_Routine implements _Routine {
  _$_Routine(
      {required this.id,
      required this.smartItemId,
      required this.name,
      required this.turnOnTime,
      required this.turnOffTime,
      required this.frequency,
      required this.state});

  @override

  /// Unique identifier
  final String id;
  @override

  /// Unique identifier of a [SmartItem]
  final String smartItemId;
  @override

  /// The routine name
  final String name;
  @override

  /// Time to turn on the service or device
  final DateTime turnOnTime;
  @override

  /// Time to turn off the service or device
  final DateTime turnOffTime;
  @override

  /// Frequency in which this routine is going to be executed
  /// [daily, weekly, monthly]
  final RoutineFrequency frequency;
  @override

  /// Routine State [disable, enable]
  final RoutineState state;

  @override
  String toString() {
    return 'Routine(id: $id, smartItemId: $smartItemId, name: $name, turnOnTime: $turnOnTime, turnOffTime: $turnOffTime, frequency: $frequency, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Routine &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.smartItemId, smartItemId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.turnOnTime, turnOnTime) &&
            const DeepCollectionEquality()
                .equals(other.turnOffTime, turnOffTime) &&
            const DeepCollectionEquality().equals(other.frequency, frequency) &&
            const DeepCollectionEquality().equals(other.state, state));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(smartItemId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(turnOnTime),
      const DeepCollectionEquality().hash(turnOffTime),
      const DeepCollectionEquality().hash(frequency),
      const DeepCollectionEquality().hash(state));

  @JsonKey(ignore: true)
  @override
  _$RoutineCopyWith<_Routine> get copyWith =>
      __$RoutineCopyWithImpl<_Routine>(this, _$identity);
}

abstract class _Routine implements Routine {
  factory _Routine(
      {required String id,
      required String smartItemId,
      required String name,
      required DateTime turnOnTime,
      required DateTime turnOffTime,
      required RoutineFrequency frequency,
      required RoutineState state}) = _$_Routine;

  @override

  /// Unique identifier
  String get id;
  @override

  /// Unique identifier of a [SmartItem]
  String get smartItemId;
  @override

  /// The routine name
  String get name;
  @override

  /// Time to turn on the service or device
  DateTime get turnOnTime;
  @override

  /// Time to turn off the service or device
  DateTime get turnOffTime;
  @override

  /// Frequency in which this routine is going to be executed
  /// [daily, weekly, monthly]
  RoutineFrequency get frequency;
  @override

  /// Routine State [disable, enable]
  RoutineState get state;
  @override
  @JsonKey(ignore: true)
  _$RoutineCopyWith<_Routine> get copyWith =>
      throw _privateConstructorUsedError;
}
