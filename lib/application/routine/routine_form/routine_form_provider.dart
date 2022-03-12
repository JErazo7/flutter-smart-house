part of 'routine_form_notifier.dart';

final routineNotifierProvider = StateNotifierProvider.family
    .autoDispose<RoutineFormNotifier, RoutineFormState, Routine?>(
  (ref, routine) {
    final repository = ref.watch(routineRepositoryProvider);
    return RoutineFormNotifier(repository, routine: routine);
  },
);
