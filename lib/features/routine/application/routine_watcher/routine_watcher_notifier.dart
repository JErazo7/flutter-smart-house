import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_house/features/routine/domain/i_routine_repository.dart';
import 'package:smart_house/features/routine/domain/routine_failure.dart';

import '../../domain/routine.dart';
import '../../infrastructure/routine_repository.dart';

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
      Either<RoutineFailure, List<Routine>> failureOrRoutines) {
    state = failureOrRoutines.fold(
      (f) => RoutineWatcherState.error(f),
      (ruotines) => RoutineWatcherState.data(ruotines),
    );
  }

  @override
  void dispose() {
    _routineStreamSubscription?.cancel();
    super.dispose();
  }
}
