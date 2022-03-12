import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/routine/i_routine_repository.dart';
import '../../../domain/routine/routine.dart';
import '../../../domain/routine/routine_failure.dart';
import '../../../infrastructure/routine/routine_repository.dart';

part 'routine_watcher_state.dart';
part 'routine_watcher_provider.dart';
part 'routine_watcher_notifier.freezed.dart';

class RoutineWatcherNotifier extends StateNotifier<RoutineWatcherState> {
  final IRoutineRepository _repository;

  StreamSubscription<Either<RoutineFailure, List<Routine>>>?
      _routineStreamSubscription;

  RoutineWatcherNotifier(this._repository)
      : super(const RoutineWatcherState.loading());

  Future<void> watchAllStarted() async {
    state = const RoutineWatcherState.loading();

    await _routineStreamSubscription?.cancel();
    _routineStreamSubscription = _repository
        .watchAll()
        .listen((routines) => _routinesReceived(routines));
  }

  void _routinesReceived(
    Either<RoutineFailure, List<Routine>> failureOrRoutines,
  ) {
    state = failureOrRoutines.fold(
      (f) => RoutineWatcherState.error(f),
      (routines) => RoutineWatcherState.data(routines),
    );
  }

  @override
  void dispose() {
    _routineStreamSubscription?.cancel();
    super.dispose();
  }
}
