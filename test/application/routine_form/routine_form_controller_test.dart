import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:smart_house/application/routine/routine_form/routine_form_controller.dart';
import 'package:smart_house/domain/routine/i_routine_repository.dart';
import 'package:smart_house/domain/routine/routine.dart';
import 'package:smart_house/infrastructure/routine/routine_repository.dart';

import '../../mocks.dart';

void main() {
  late ProviderContainer container;
  late IRoutineRepository repository;

  setUpAll(() {
    registerFallbackValue(MockRoutineRepository());
    repository = MockRoutineRepository();
  });

  setUp(
    () {
      container = ProviderContainer(
        overrides: [
          routineRepositoryProvider.overrideWithValue(repository),
        ],
      );
    },
  );
  group(
    'RoutineFormController unit test when',
    () {
      test(
        'name is updated',
        () async {
          final provider = routineFormControllerProvider(null);

          const name = 'Josue';
          container.read(provider.notifier).nameUpdated(name);

          expect(container.read(provider).routine.name, name);
        },
      );
      test(
        'smartItemId is updated',
        () async {
          final provider = routineFormControllerProvider(null);

          const id = '2';
          container.read(provider.notifier).smartItemIdUpdated(id);

          expect(container.read(provider).routine.smartItemId, id);
        },
      );
      test(
        'frequency is updated',
        () async {
          final provider = routineFormControllerProvider(null);

          const frequency = RoutineFrequency.daily;
          container.read(provider.notifier).frequencyUpdated(frequency);

          expect(container.read(provider).routine.frequency, frequency);
        },
      );
      test(
        'turnOffTime is updated',
        () async {
          final provider = routineFormControllerProvider(null);

          final turnOffTime = DateTime(2022, 03, 02);
          container.read(provider.notifier).turnOffTimeUpdated(turnOffTime);

          expect(container.read(provider).routine.turnOffTime, turnOffTime);
        },
      );

      test(
        'turnOnTime is updated',
        () async {
          final provider = routineFormControllerProvider(null);

          final turnOnTime = DateTime(2022, 03, 02);
          container.read(provider.notifier).turnOnTimeUpdated(turnOnTime);

          expect(container.read(provider).routine.turnOnTime, turnOnTime);
        },
      );

      test(
        'is editing',
        () async {
          final routine = Routine.empty().copyWith(name: 'New Routine');
          final provider = routineFormControllerProvider(routine);
          final state = container.read(provider);

          expect(state.routine, routine);
          expect(state.isEditing, true);
        },
      );
      test(
        'is saved',
        () async {
          final provider = routineFormControllerProvider(null);
          final routine = container.read(provider).routine;

          when(
            () => repository.create(routine),
          ).thenAnswer((_) async {
            return await Future.delayed(
              const Duration(milliseconds: 300),
              () => Future.value(right(unit)),
            );
          });

          final initialState = container.read(provider);
          final state = container.listen(provider, (_, __) {});

          container.read(provider.notifier).saved();

          expect(state.read(), initialState.copyWith(isSaving: true));

          await Future.delayed(const Duration(milliseconds: 400));

          expect(
            state.read(),
            initialState.copyWith(
              saveFailureOrSuccessOption: optionOf(right(unit)),
            ),
          );
        },
      );
      test(
        'is updated',
        () async {
          final routine = Routine.empty().copyWith(name: 'new routine');
          final provider = routineFormControllerProvider(routine);

          when(
            () => repository.update(routine),
          ).thenAnswer((_) async {
            return await Future.delayed(
              const Duration(milliseconds: 300),
              () => Future.value(right(unit)),
            );
          });

          final initialState = container.read(provider);
          final state = container.listen(provider, (_, __) {});

          container.read(provider.notifier).saved();

          expect(state.read(), initialState.copyWith(isSaving: true));

          await Future.delayed(const Duration(milliseconds: 400));

          expect(
            state.read(),
            initialState.copyWith(
              saveFailureOrSuccessOption: optionOf(right(unit)),
            ),
          );
        },
      );
    },
  );
}
