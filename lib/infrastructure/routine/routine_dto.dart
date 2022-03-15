import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/routine/routine.dart';

part 'routine_dto.freezed.dart';
part 'routine_dto.g.dart';

@freezed
class RoutineDto with _$RoutineDto {
  RoutineDto._();

  factory RoutineDto({
    required String id,
    required String smartItemId,
    required String name,
    @ServerTimestampConverter() required DateTime turnOnTime,
    @ServerTimestampConverter() required DateTime turnOffTime,
    required String frequency,
    required String state,
  }) = _RoutineDto;

  /// Create a [RoutineDto] object from a [routine]
  factory RoutineDto.fromDomain(Routine routine) {
    return RoutineDto(
      id: routine.id,
      smartItemId: routine.smartItemId,
      name: routine.name,
      turnOnTime: routine.turnOnTime.toUtc(),
      turnOffTime: routine.turnOffTime.toUtc(),
      frequency: describeEnum(routine.frequency),
      state: describeEnum(routine.state),
    );
  }

  /// Create a [routine] object from a [RoutineDto]
  Routine toDomain() {
    return Routine(
      id: id,
      smartItemId: smartItemId,
      name: name,
      turnOnTime: turnOnTime.toLocal(),
      turnOffTime: turnOffTime.toLocal(),
      state: RoutineState.values.firstWhere(
        (element) => describeEnum(element) == state,
        orElse: () => RoutineState.disable,
      ),
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

/// A custom converter to timestamp objects
class ServerTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const ServerTimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime date) => Timestamp.fromDate(date);
}
