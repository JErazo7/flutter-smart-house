// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'routine_form_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoutineFormStateTearOff {
  const _$RoutineFormStateTearOff();

  _RoutineFormState call(
      {required Routine routine,
      required bool isEditing,
      required bool isSaving,
      required Option<Either<RoutineFailure, Unit>>
          saveFailureOrSuccessOption}) {
    return _RoutineFormState(
      routine: routine,
      isEditing: isEditing,
      isSaving: isSaving,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
const $RoutineFormState = _$RoutineFormStateTearOff();

/// @nodoc
mixin _$RoutineFormState {
  Routine get routine => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  Option<Either<RoutineFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoutineFormStateCopyWith<RoutineFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoutineFormStateCopyWith<$Res> {
  factory $RoutineFormStateCopyWith(
          RoutineFormState value, $Res Function(RoutineFormState) then) =
      _$RoutineFormStateCopyWithImpl<$Res>;
  $Res call(
      {Routine routine,
      bool isEditing,
      bool isSaving,
      Option<Either<RoutineFailure, Unit>> saveFailureOrSuccessOption});

  $RoutineCopyWith<$Res> get routine;
}

/// @nodoc
class _$RoutineFormStateCopyWithImpl<$Res>
    implements $RoutineFormStateCopyWith<$Res> {
  _$RoutineFormStateCopyWithImpl(this._value, this._then);

  final RoutineFormState _value;
  // ignore: unused_field
  final $Res Function(RoutineFormState) _then;

  @override
  $Res call({
    Object? routine = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      routine: routine == freezed
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as Routine,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<RoutineFailure, Unit>>,
    ));
  }

  @override
  $RoutineCopyWith<$Res> get routine {
    return $RoutineCopyWith<$Res>(_value.routine, (value) {
      return _then(_value.copyWith(routine: value));
    });
  }
}

/// @nodoc
abstract class _$RoutineFormStateCopyWith<$Res>
    implements $RoutineFormStateCopyWith<$Res> {
  factory _$RoutineFormStateCopyWith(
          _RoutineFormState value, $Res Function(_RoutineFormState) then) =
      __$RoutineFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Routine routine,
      bool isEditing,
      bool isSaving,
      Option<Either<RoutineFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $RoutineCopyWith<$Res> get routine;
}

/// @nodoc
class __$RoutineFormStateCopyWithImpl<$Res>
    extends _$RoutineFormStateCopyWithImpl<$Res>
    implements _$RoutineFormStateCopyWith<$Res> {
  __$RoutineFormStateCopyWithImpl(
      _RoutineFormState _value, $Res Function(_RoutineFormState) _then)
      : super(_value, (v) => _then(v as _RoutineFormState));

  @override
  _RoutineFormState get _value => super._value as _RoutineFormState;

  @override
  $Res call({
    Object? routine = freezed,
    Object? isEditing = freezed,
    Object? isSaving = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_RoutineFormState(
      routine: routine == freezed
          ? _value.routine
          : routine // ignore: cast_nullable_to_non_nullable
              as Routine,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<RoutineFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_RoutineFormState implements _RoutineFormState {
  const _$_RoutineFormState(
      {required this.routine,
      required this.isEditing,
      required this.isSaving,
      required this.saveFailureOrSuccessOption});

  @override
  final Routine routine;
  @override
  final bool isEditing;
  @override
  final bool isSaving;
  @override
  final Option<Either<RoutineFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'RoutineFormState(routine: $routine, isEditing: $isEditing, isSaving: $isSaving, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RoutineFormState &&
            const DeepCollectionEquality().equals(other.routine, routine) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving) &&
            const DeepCollectionEquality().equals(
                other.saveFailureOrSuccessOption, saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(routine),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(isSaving),
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$RoutineFormStateCopyWith<_RoutineFormState> get copyWith =>
      __$RoutineFormStateCopyWithImpl<_RoutineFormState>(this, _$identity);
}

abstract class _RoutineFormState implements RoutineFormState {
  const factory _RoutineFormState(
      {required Routine routine,
      required bool isEditing,
      required bool isSaving,
      required Option<Either<RoutineFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_RoutineFormState;

  @override
  Routine get routine;
  @override
  bool get isEditing;
  @override
  bool get isSaving;
  @override
  Option<Either<RoutineFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$RoutineFormStateCopyWith<_RoutineFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
