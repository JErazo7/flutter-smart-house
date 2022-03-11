import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_house/core/services/firebase_services.dart';
import 'package:smart_house/features/routine/domain/i_routine_repository.dart';
import 'package:smart_house/features/routine/domain/routine_failure.dart';
import 'package:smart_house/features/routine/domain/routine.dart';

final routineRepositoryProvider = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);
  return RoutineRepository(firestore);
});

class RoutineRepository extends IRoutineRepository {
  final FirebaseFirestore _firestore;

  RoutineRepository(this._firestore);

  @override
  Future<Either<RoutineFailure, Unit>> create(Routine routine) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<RoutineFailure, Unit>> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Either<RoutineFailure, Unit>> update(Routine routine) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<RoutineFailure, List<Routine>>> watchAll() {
    // TODO: implement watchAll
    throw UnimplementedError();
  }
}
