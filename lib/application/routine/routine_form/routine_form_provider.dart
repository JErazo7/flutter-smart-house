part of 'routine_form_controller.dart';

final routineFormControllerProvider =
    StateNotifierProvider.autoDispose<RoutineFormController, RoutineFormState>(
  (ref) {
    final repository = ref.watch(routineRepositoryProvider);
    return RoutineFormController(repository);
  },
);
