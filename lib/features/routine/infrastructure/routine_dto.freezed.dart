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
      required String name,
      required DateTime turnOnTime,
      required DateTime turnOffTime,
      required String frequency}) {
    return _RoutineDto(
      id: id,
      name: name,
      turnOnTime: turnOnTime,
      turnOffTime: turnOffTime,
      frequency: frequency,
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
  String get name => throw _privateConstructorUsedError;
  DateTime get turnOnTime => throw _privateConstructorUsedError;
  DateTime get turnOffTime => throw _privateConstructorUsedError;
  String get frequency => throw _privateConstructorUsedError;

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
      String name,
      DateTime turnOnTime,
      DateTime turnOffTime,
      String frequency});
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
    Object? name = freezed,
    Object? turnOnTime = freezed,
    Object? turnOffTime = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      String name,
      DateTime turnOnTime,
      DateTime turnOffTime,
      String frequency});
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
    Object? name = freezed,
    Object? turnOnTime = freezed,
    Object? turnOffTime = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_RoutineDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RoutineDto extends _RoutineDto with DiagnosticableTreeMixin {
  _$_RoutineDto(
      {required this.id,
      required this.name,
      required this.turnOnTime,
      required this.turnOffTime,
      required this.frequency})
      : super._();

  factory _$_RoutineDto.fromJson(Map<String, dynamic> json) =>
      _$$_RoutineDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime turnOnTime;
  @override
  final DateTime turnOffTime;
  @override
  final String frequency;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RoutineDto(id: $id, name: $name, turnOnTime: $turnOnTime, turnOffTime: $turnOffTime, frequency: $frequency)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RoutineDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('turnOnTime', turnOnTime))
      ..add(DiagnosticsProperty('turnOffTime', turnOffTime))
      ..add(DiagnosticsProperty('frequency', frequency));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutineDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.turnOnTime, turnOnTime) &&
            const DeepCollectionEquality()
                .equals(other.turnOffTime, turnOffTime) &&
            const DeepCollectionEquality().equals(other.frequency, frequency));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(turnOnTime),
      const DeepCollectionEquality().hash(turnOffTime),
      const DeepCollectionEquality().hash(frequency));

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
      required String name,
      required DateTime turnOnTime,
      required DateTime turnOffTime,
      required String frequency}) = _$_RoutineDto;
  _RoutineDto._() : super._();

  factory _RoutineDto.fromJson(Map<String, dynamic> json) =
      _$_RoutineDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get turnOnTime;
  @override
  DateTime get turnOffTime;
  @override
  String get frequency;
  @override
  @JsonKey(ignore: true)
  _$RoutineDtoCopyWith<_RoutineDto> get copyWith =>
      throw _privateConstructorUsedError;
}
