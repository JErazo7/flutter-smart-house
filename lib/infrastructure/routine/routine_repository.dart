import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/routine/i_routine_repository.dart';
import '../../domain/routine/routine.dart';
import '../../domain/routine/routine_failure.dart';
import '../core/firebase_services.dart';
import '../core/firestore_helpers.dart';
import 'routine_dto.dart';

final routineRepositoryProvider =
    Provider.autoDispose<IRoutineRepository>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return RoutineRepository(firestore);
});

class RoutineRepository implements IRoutineRepository {
  final FirebaseFirestore _firestore;

  RoutineRepository(this._firestore);

  @override
  Future<Either<RoutineFailure, Unit>> create(Routine routine) async {
    try {
      final dto = RoutineDto.fromDomain(routine);
      final reference = _firestore.rotuineCollection.doc(dto.id);
      await reference.set(dto.toJson());
      return right(unit);
    } on FirebaseException catch (_) {
      return left(RoutineFailure.serverError());
    } on Exception catch (_) {
      return left(RoutineFailure.unexpected());
    }
  }

  @override
  Future<Either<RoutineFailure, Unit>> remove(String id) async {
    try {
      final reference = _firestore.rotuineCollection.doc(id);
      await reference.delete();
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        return left(RoutineFailure.permissionDenied());
      }
      return left(RoutineFailure.serverError());
    } on Exception catch (_) {
      return left(RoutineFailure.unexpected());
    }
  }

  @override
  Future<Either<RoutineFailure, Unit>> update(Routine routine) async {
    try {
      final dto = RoutineDto.fromDomain(routine);
      final reference = _firestore.rotuineCollection.doc(dto.id);
      await reference.update(dto.toJson());
      return right(unit);
    } on FirebaseException catch (e) {
      if (e.code == 'permission-denied') {
        return left(RoutineFailure.permissionDenied());
      }
      return left(RoutineFailure.serverError());
    } on Exception catch (_) {
      return left(RoutineFailure.unexpected());
    }
  }

  @override
  Stream<Either<RoutineFailure, List<Routine>>> watchAll() async* {
    final reference = _firestore.rotuineCollection;
    yield* reference.snapshots().map((e) {
      final routines = e.docs.map((doc) {
        final json = doc.data() as Map<String, dynamic>;
        final routine = RoutineDto.fromJson(json).toDomain();
        return routine;
      }).toList();

      return right<RoutineFailure, List<Routine>>(routines);
    }).onErrorReturnWith((_, __) {
      return left<RoutineFailure, List<Routine>>(RoutineFailure.unexpected());
    });
  }
}
