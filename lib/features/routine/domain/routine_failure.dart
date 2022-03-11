import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_failure.freezed.dart';

@freezed
class RoutineFailure with _$RoutineFailure {
  factory RoutineFailure.unexpected() = Unexpected;
  factory RoutineFailure.serverError() = ServerError;
}
