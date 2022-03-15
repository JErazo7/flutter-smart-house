// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'smart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SmartItemDto _$SmartItemDtoFromJson(Map<String, dynamic> json) {
  return _SmartItemDto.fromJson(json);
}

/// @nodoc
class _$SmartItemDtoTearOff {
  const _$SmartItemDtoTearOff();

  _SmartItemDto call(
      {required String id,
      required String name,
      required String type,
      required String state,
      int? iconId}) {
    return _SmartItemDto(
      id: id,
      name: name,
      type: type,
      state: state,
      iconId: iconId,
    );
  }

  SmartItemDto fromJson(Map<String, Object?> json) {
    return SmartItemDto.fromJson(json);
  }
}

/// @nodoc
const $SmartItemDto = _$SmartItemDtoTearOff();

/// @nodoc
mixin _$SmartItemDto {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  int? get iconId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SmartItemDtoCopyWith<SmartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartItemDtoCopyWith<$Res> {
  factory $SmartItemDtoCopyWith(
          SmartItemDto value, $Res Function(SmartItemDto) then) =
      _$SmartItemDtoCopyWithImpl<$Res>;
  $Res call({String id, String name, String type, String state, int? iconId});
}

/// @nodoc
class _$SmartItemDtoCopyWithImpl<$Res> implements $SmartItemDtoCopyWith<$Res> {
  _$SmartItemDtoCopyWithImpl(this._value, this._then);

  final SmartItemDto _value;
  // ignore: unused_field
  final $Res Function(SmartItemDto) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? state = freezed,
    Object? iconId = freezed,
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
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: iconId == freezed
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$SmartItemDtoCopyWith<$Res>
    implements $SmartItemDtoCopyWith<$Res> {
  factory _$SmartItemDtoCopyWith(
          _SmartItemDto value, $Res Function(_SmartItemDto) then) =
      __$SmartItemDtoCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, String type, String state, int? iconId});
}

/// @nodoc
class __$SmartItemDtoCopyWithImpl<$Res> extends _$SmartItemDtoCopyWithImpl<$Res>
    implements _$SmartItemDtoCopyWith<$Res> {
  __$SmartItemDtoCopyWithImpl(
      _SmartItemDto _value, $Res Function(_SmartItemDto) _then)
      : super(_value, (v) => _then(v as _SmartItemDto));

  @override
  _SmartItemDto get _value => super._value as _SmartItemDto;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? state = freezed,
    Object? iconId = freezed,
  }) {
    return _then(_SmartItemDto(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      iconId: iconId == freezed
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SmartItemDto extends _SmartItemDto with DiagnosticableTreeMixin {
  _$_SmartItemDto(
      {required this.id,
      required this.name,
      required this.type,
      required this.state,
      this.iconId})
      : super._();

  factory _$_SmartItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_SmartItemDtoFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String state;
  @override
  final int? iconId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SmartItemDto(id: $id, name: $name, type: $type, state: $state, iconId: $iconId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SmartItemDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('iconId', iconId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SmartItemDto &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.iconId, iconId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(iconId));

  @JsonKey(ignore: true)
  @override
  _$SmartItemDtoCopyWith<_SmartItemDto> get copyWith =>
      __$SmartItemDtoCopyWithImpl<_SmartItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SmartItemDtoToJson(this);
  }
}

abstract class _SmartItemDto extends SmartItemDto {
  factory _SmartItemDto(
      {required String id,
      required String name,
      required String type,
      required String state,
      int? iconId}) = _$_SmartItemDto;
  _SmartItemDto._() : super._();

  factory _SmartItemDto.fromJson(Map<String, dynamic> json) =
      _$_SmartItemDto.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get type;
  @override
  String get state;
  @override
  int? get iconId;
  @override
  @JsonKey(ignore: true)
  _$SmartItemDtoCopyWith<_SmartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
