// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'smart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SmartItemTearOff {
  const _$SmartItemTearOff();

  _SmartItem call(
      {required String id,
      required String name,
      required SmartItemType type,
      required SmartItemState state,
      required int iconId}) {
    return _SmartItem(
      id: id,
      name: name,
      type: type,
      state: state,
      iconId: iconId,
    );
  }
}

/// @nodoc
const $SmartItem = _$SmartItemTearOff();

/// @nodoc
mixin _$SmartItem {
  /// Unique identifier
  String get id => throw _privateConstructorUsedError;

  /// The SmartItem name
  String get name => throw _privateConstructorUsedError;

  /// The SmartItem type [device, service]
  SmartItemType get type => throw _privateConstructorUsedError;

  /// The SmartItem state [on, off]
  SmartItemState get state => throw _privateConstructorUsedError;

  /// Icon to indentify the SmartItem
  int get iconId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SmartItemCopyWith<SmartItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartItemCopyWith<$Res> {
  factory $SmartItemCopyWith(SmartItem value, $Res Function(SmartItem) then) =
      _$SmartItemCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String name,
      SmartItemType type,
      SmartItemState state,
      int iconId});
}

/// @nodoc
class _$SmartItemCopyWithImpl<$Res> implements $SmartItemCopyWith<$Res> {
  _$SmartItemCopyWithImpl(this._value, this._then);

  final SmartItem _value;
  // ignore: unused_field
  final $Res Function(SmartItem) _then;

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
              as SmartItemType,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SmartItemState,
      iconId: iconId == freezed
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$SmartItemCopyWith<$Res> implements $SmartItemCopyWith<$Res> {
  factory _$SmartItemCopyWith(
          _SmartItem value, $Res Function(_SmartItem) then) =
      __$SmartItemCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String name,
      SmartItemType type,
      SmartItemState state,
      int iconId});
}

/// @nodoc
class __$SmartItemCopyWithImpl<$Res> extends _$SmartItemCopyWithImpl<$Res>
    implements _$SmartItemCopyWith<$Res> {
  __$SmartItemCopyWithImpl(_SmartItem _value, $Res Function(_SmartItem) _then)
      : super(_value, (v) => _then(v as _SmartItem));

  @override
  _SmartItem get _value => super._value as _SmartItem;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? state = freezed,
    Object? iconId = freezed,
  }) {
    return _then(_SmartItem(
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
              as SmartItemType,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as SmartItemState,
      iconId: iconId == freezed
          ? _value.iconId
          : iconId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SmartItem implements _SmartItem {
  _$_SmartItem(
      {required this.id,
      required this.name,
      required this.type,
      required this.state,
      required this.iconId});

  @override

  /// Unique identifier
  final String id;
  @override

  /// The SmartItem name
  final String name;
  @override

  /// The SmartItem type [device, service]
  final SmartItemType type;
  @override

  /// The SmartItem state [on, off]
  final SmartItemState state;
  @override

  /// Icon to indentify the SmartItem
  final int iconId;

  @override
  String toString() {
    return 'SmartItem(id: $id, name: $name, type: $type, state: $state, iconId: $iconId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SmartItem &&
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
  _$SmartItemCopyWith<_SmartItem> get copyWith =>
      __$SmartItemCopyWithImpl<_SmartItem>(this, _$identity);
}

abstract class _SmartItem implements SmartItem {
  factory _SmartItem(
      {required String id,
      required String name,
      required SmartItemType type,
      required SmartItemState state,
      required int iconId}) = _$_SmartItem;

  @override

  /// Unique identifier
  String get id;
  @override

  /// The SmartItem name
  String get name;
  @override

  /// The SmartItem type [device, service]
  SmartItemType get type;
  @override

  /// The SmartItem state [on, off]
  SmartItemState get state;
  @override

  /// Icon to indentify the SmartItem
  int get iconId;
  @override
  @JsonKey(ignore: true)
  _$SmartItemCopyWith<_SmartItem> get copyWith =>
      throw _privateConstructorUsedError;
}
