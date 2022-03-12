import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/routine/i_routine_repository.dart';
import '../../../domain/routine/routine_failure.dart';

part 'routine_eliminator_state.dart';
part 'routine_eliminator_notifier.freezed.dart';

class RoutineEliminatorNotifier extends StateNotifier<RoutineEliminatorState> {
  final IRoutineRepository _repository;

  RoutineEliminatorNotifier(this._repository)
      : super(const RoutineEliminatorState.initial());

  Future<void> deleted(String id) async {
    state = const RoutineEliminatorState.actionInProgress();
    final response = await _repository.remove(id);
    state = response.fold(
      (f) => RoutineEliminatorState.deleteFailure(f),
      (_) => const RoutineEliminatorState.deleteSuccess(),
    );
  }
}
