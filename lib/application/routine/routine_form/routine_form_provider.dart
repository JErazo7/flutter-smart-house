part of 'routine_form_controller.dart';

final routineFormControllerProvider = StateNotifierProvider.family
    .autoDispose<RoutineFormController, RoutineFormState, Routine?>(
  (ref, routine) {
    final repository = ref.watch(routineRepositoryProvider);
    return RoutineFormController(repository, routine);
  },
);
