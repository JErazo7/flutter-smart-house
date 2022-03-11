part of 'routine_watcher_notifier.dart';

@freezed
class RoutineWatcherState with _$RoutineWatcherState {
  const factory RoutineWatcherState.loading() = Loading;
  const factory RoutineWatcherState.data(List<Routine> routines) = Data;
  const factory RoutineWatcherState.error(RoutineFailure failure) = Error;
}
