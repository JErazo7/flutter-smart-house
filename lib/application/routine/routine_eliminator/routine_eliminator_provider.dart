part of 'routine_eliminator_controller.dart';

final routineFormControllerProvider = StateNotifierProvider.autoDispose<
    RoutineEliminatorController, RoutineEliminatorState>(
  (ref) {
    final repository = ref.watch(routineRepositoryProvider);
    return RoutineEliminatorController(repository);
  },
);
