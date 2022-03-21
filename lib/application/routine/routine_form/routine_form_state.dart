part of 'routine_form_controller.dart';

@freezed
class RoutineFormState with _$RoutineFormState {
  const factory RoutineFormState({
    required Routine routine,
    required bool isEditing,
    required bool isSaving,
    required Option<Either<RoutineFailure, Unit>> saveFailureOrSuccessOption,
  }) = _RoutineFormState;

  factory RoutineFormState.initial(Routine? routine) {
    return RoutineFormState(
      routine: routine ?? Routine.empty(),
      isEditing: routine != null,
      isSaving: false,
      saveFailureOrSuccessOption: none(),
    );
  }
}
