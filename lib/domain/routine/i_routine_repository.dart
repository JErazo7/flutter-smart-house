import 'package:dartz/dartz.dart';
import 'routine.dart';
import 'routine_failure.dart';

abstract class IRoutineRepository {
  /// Watch a list of rotuines linked with the current user
  Stream<Either<RoutineFailure, List<Routine>>> watchAll();

  /// Create a new [routine]
  Future<Either<RoutineFailure, Unit>> create(Routine routine);

  /// Update a [routine]
  Future<Either<RoutineFailure, Unit>> update(Routine routine);

  /// Remove a [routine] by their id
  Future<Either<RoutineFailure, Unit>> remove(String id);
}
