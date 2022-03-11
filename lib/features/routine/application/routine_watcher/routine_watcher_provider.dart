part of 'routine_watcher_notifier.dart';

final routineNotifierProvider = StateNotifierProvider.autoDispose<
    RoutineWatcherNotifier, RoutineWatcherState>(
  (ref) {
    final repository = ref.watch(routineRepositoryProvider);
    return RoutineWatcherNotifier(repository);
  },
);
