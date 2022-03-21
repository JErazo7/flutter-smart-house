import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/routine/i_routine_repository.dart';
import '../../../domain/routine/routine.dart';
import '../../../domain/routine/routine_failure.dart';
import '../../../infrastructure/routine/routine_repository.dart';

part 'routine_form_state.dart';
part 'routine_form_provider.dart';
part 'routine_form_controller.freezed.dart';

class RoutineFormController extends StateNotifier<RoutineFormState> {
  final IRoutineRepository _repository;

  RoutineFormController(this._repository, Routine? routine)
      : super(RoutineFormState.initial(routine));

  void nameUpdated(String name) {
    state = state.copyWith(
      routine: state.routine.copyWith(name: name),
      saveFailureOrSuccessOption: none(),
    );
  }

  void smartItemIdUpdated(String id) {
    state = state.copyWith(
      routine: state.routine.copyWith(smartItemId: id),
      saveFailureOrSuccessOption: none(),
    );
  }

  void frequencyUpdated(RoutineFrequency frequency) {
    state = state.copyWith(
      routine: state.routine.copyWith(frequency: frequency),
      saveFailureOrSuccessOption: none(),
    );
  }

  void turnOffTimeUpdated(DateTime turnOffTime) {
    state = state.copyWith(
      routine: state.routine.copyWith(turnOffTime: turnOffTime),
      saveFailureOrSuccessOption: none(),
    );
  }

  void turnOnTimeUpdated(DateTime turnOnTime) {
    state = state.copyWith(
      routine: state.routine.copyWith(turnOnTime: turnOnTime),
      saveFailureOrSuccessOption: none(),
    );
  }

  Future<void> saved() async {
    state = state.copyWith(
      isSaving: true,
      saveFailureOrSuccessOption: none(),
    );

    late final Either<RoutineFailure, Unit> response;
    if (state.isEditing) {
      response = await _repository.update(state.routine);
    } else {
      response = await _repository.create(state.routine);
    }

    state = state.copyWith(
      isSaving: false,
      saveFailureOrSuccessOption: optionOf(response),
    );
  }
}
