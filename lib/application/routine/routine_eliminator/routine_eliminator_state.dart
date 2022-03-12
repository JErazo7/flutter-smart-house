part of 'routine_eliminator_notifier.dart';

@freezed
class RoutineEliminatorState with _$RoutineEliminatorState {
  const factory RoutineEliminatorState.initial() = Initial;
  const factory RoutineEliminatorState.actionInProgress() = ActionInProgress;
  const factory RoutineEliminatorState.deleteFailure(RoutineFailure failure) =
      DeleteFailure;
  const factory RoutineEliminatorState.deleteSuccess() = DeleteSuccess;
}
