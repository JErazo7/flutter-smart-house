// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routine_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RoutineDto _$RoutineDtoFromJson(Map<String, dynamic> json) {
  return _RoutineDto.fromJson(json);
}

/// @nodoc
class _$RoutineDtoTearOff {
  const _$RoutineDtoTearOff();

  _RoutineDto call(
      {required String id,
      required String smartItemId,
      required String name,
      @ServerTimestampConverter() required DateTime turnOnTime,
      @ServerTimestampConverter() required DateTime turnOffTime,
      required String frequency,
      required String state}) {
    return _RoutineDto(
      id: id,
      smartItemId: smartItemId,
      name: name,
      turnOnTime: turnOnTime,
      turnOffTime: turnOffTime,
      frequency: frequency,
      state: state,
    );
  }

  RoutineDto fromJson(Map<String, Object?> json) {
    return RoutineDto.fromJson(json);
  }
}

/// @nodoc
const $RoutineDto = _$RoutineDtoTearOff();

/// @nodoc
mixin _$RoutineDto {
  String get id => throw _privateConstructorUsedError;
  String get smartItemId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime get turnOnTime => throw _privateConstructorUsedError;
  @ServerTimestampConverter()
  DateTime get turnOffTime => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoutineDtoCopyWith<RoutineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineDtoCopyWith<$Res> {
  factory $RoutineDtoCopyWith(
          RoutineDto value, $Res Function(RoutineDto) then) =
      _$RoutineDtoCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String smartItemId,
      String name,
      @ServerTimestampConverter() DateTime turnOnTime,
      @ServerTimestampConverter() DateTime turnOffTime,
      String frequency,
      String state});
}

/// @nodoc
class _$RoutineDtoCopyWithImpl<$Res> implements $RoutineDtoCopyWith<$Res> {
  _$RoutineDtoCopyWithImpl(this._value, this._then);

  final RoutineDto _value;
  // ignore: unused_field
  final $Res Function(RoutineDto) _then;

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
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RoutineDtoCopyWith<$Res> implements $RoutineDtoCopyWith<$Res> {
  factory _$RoutineDtoCopyWith(
          _RoutineDto value, $Res Function(_RoutineDto) then) =
      __$RoutineDtoCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String smartItemId,
      String name,
      @ServerTimestampConverter() DateTime turnOnTime,
      @ServerTimestampConverter() DateTime turnOffTime,
      String frequency,
      String state});
}

/// @nodoc
class __$RoutineDtoCopyWithImpl<$Res> extends _$RoutineDtoCopyWithImpl<$Res>
    implements _$RoutineDtoCopyWith<$Res> {
  __$RoutineDtoCopyWithImpl(
      _RoutineDto _value, $Res Function(_RoutineDto) _then)
      : super(_value, (v) => _then(v as _RoutineDto));

  @override
  _RoutineDto get _value => super._value as _RoutineDto;

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
    return _then(_RoutineDto(
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
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoutineDto extends _RoutineDto with DiagnosticableTreeMixin {
  _$_RoutineDto(
      {required this.id,
      required this.smartItemId,
      required this.name,
      @ServerTimestampConverter() required this.turnOnTime,
      @ServerTimestampConverter() required this.turnOffTime,
      required this.frequency,
      required this.state})
      : super._();

  factory _$_RoutineDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoutineDtoFromJson(json);

  @override
  final String id;
  @override
  final String smartItemId;
  @override
  final String name;
  @override
  @ServerTimestampConverter()
  final DateTime turnOnTime;
  @override
  @ServerTimestampConverter()
  final DateTime turnOffTime;
  @override
  final String frequency;
  @override
  final String state;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutineDto(id: $id, smartItemId: $smartItemId, name: $name, turnOnTime: $turnOnTime, turnOffTime: $turnOffTime, frequency: $frequency, state: $state)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutineDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('smartItemId', smartItemId))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('turnOnTime', turnOnTime))
      ..add(DiagnosticsProperty('turnOffTime', turnOffTime))
      ..add(DiagnosticsProperty('frequency', frequency))
      ..add(DiagnosticsProperty('state', state));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutineDto &&
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
  _$RoutineDtoCopyWith<_RoutineDto> get copyWith =>
      __$RoutineDtoCopyWithImpl<_RoutineDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RoutineDtoToJson(this);
  }
}

abstract class _RoutineDto extends RoutineDto {
  factory _RoutineDto(
      {required String id,
      required String smartItemId,
      required String name,
      @ServerTimestampConverter() required DateTime turnOnTime,
      @ServerTimestampConverter() required DateTime turnOffTime,
      required String frequency,
      required String state}) = _$_RoutineDto;
  _RoutineDto._() : super._();

  factory _RoutineDto.fromJson(Map<String, dynamic> json) =
      _$_RoutineDto.fromJson;

  @override
  String get id;
  @override
  String get smartItemId;
  @override
  String get name;
  @override
  @ServerTimestampConverter()
  DateTime get turnOnTime;
  @override
  @ServerTimestampConverter()
  DateTime get turnOffTime;
  @override
  String get frequency;
  @override
  String get state;
  @override
  @JsonKey(ignore: true)
  _$RoutineDtoCopyWith<_RoutineDto> get copyWith =>
      throw _privateConstructorUsedError;
}
