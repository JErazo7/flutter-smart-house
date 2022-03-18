part of 'routine_form_controller.dart';

@freezed
class RoutineFormState with _$RoutineFormState {
  const factory RoutineFormState({
    required Routine routine,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<RoutineFailure, Unit>> saveFailureOrSuccessOption,
  }) = _RoutineFormState;

  factory RoutineFormState.initial() {
    return RoutineFormState(
      routine: Routine.empty(),
      isEditing: false,
      isSaving: false,
      saveFailureOrSuccessOption: none(),
    );
  }
}
