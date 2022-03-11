import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smart_house/features/routine/domain/routine.dart';

part 'routine_dto.freezed.dart';
part 'routine_dto.g.dart';

@freezed
class RoutineDto with _$RoutineDto {
  RoutineDto._();

  factory RoutineDto({
    required String id,
    required String name,
    required DateTime turnOnTime,
    required DateTime turnOffTime,
    required String frequency,
  }) = _RoutineDto;

  /// Create a [RoutineDto] object from a [routine]
  factory RoutineDto.fromDomain(Routine routine) {
    return RoutineDto(
      id: routine.id,
      name: routine.name,
      turnOnTime: routine.turnOnTime.toUtc(),
      turnOffTime: routine.turnOffTime.toUtc(),
      frequency: describeEnum(routine.frequency),
    );
  }

  /// Create a [routine] object from a [RoutineDto]
  Routine toDomain() {
    return Routine(
      id: id,
      name: name,
      turnOnTime: turnOnTime.toLocal(),
      turnOffTime: turnOffTime.toLocal(),
      frequency: RoutineFrequency.values.firstWhere(
        (element) => describeEnum(element) == frequency,
        orElse: () => RoutineFrequency.daily,
      ),
    );
  }

  /// Create a [RoutineDto] object from a json
  factory RoutineDto.fromJson(Map<String, dynamic> json) =>
      _$RoutineDtoFromJson(json);
}
