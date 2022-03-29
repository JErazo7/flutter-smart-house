import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:smart_house/application/routine/routine_eliminator/routine_eliminator_controller.dart';
import 'package:smart_house/domain/routine/i_routine_repository.dart';
import 'package:smart_house/domain/routine/routine_failure.dart';
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
    'RoutineEliminatorController unit test when',
    () {
      test(
        'deleted is successfull',
        () async {
          final provider = routineEliminatorControllerProvider;
          const routineId = '1';

          when(
            () => repository.remove(routineId),
          ).thenAnswer((_) async {
            return await Future.delayed(
              const Duration(milliseconds: 300),
              () => Future.value(right(unit)),
            );
          });

          final state = container.listen(provider, (_, __) {});

          expect(
            state.read(),
            const RoutineEliminatorState.initial(),
          );

          container.read(provider.notifier).deleted(routineId);

          expect(
            state.read(),
            const RoutineEliminatorState.actionInProgress(),
          );

          await Future.delayed(const Duration(milliseconds: 400));

          expect(
            state.read(),
            const RoutineEliminatorState.deleteSuccess(),
          );
        },
      );
      test(
        'deleted is a failure',
        () async {
          final provider = routineEliminatorControllerProvider;
          const routineId = '1';
          final failure = RoutineFailure.unexpected();

          when(
            () => repository.remove(routineId),
          ).thenAnswer((_) async {
            return await Future.delayed(
              const Duration(milliseconds: 300),
              () => Future.value(left(failure)),
            );
          });

          final state = container.listen(provider, (_, __) {});

          expect(
            state.read(),
            const RoutineEliminatorState.initial(),
          );

          container.read(provider.notifier).deleted(routineId);

          expect(
            state.read(),
            const RoutineEliminatorState.actionInProgress(),
          );

          await Future.delayed(const Duration(milliseconds: 400));

          expect(
            state.read(),
            RoutineEliminatorState.deleteFailure(failure),
          );
        },
      );
    },
  );
}
