import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'routine.freezed.dart';

@freezed
class Routine with _$Routine {
  factory Routine({
    /// Unique identifier
    required String id,

    /// Unique identifier of a [SmartItem]
    required String smartItemId,

    /// The routine name
    required String name,

    /// Time to turn on the service or device
    required DateTime turnOnTime,

    /// Time to turn off the service or device
    required DateTime turnOffTime,

    /// Frequency in which this routine is going to be executed
    required RoutineFrequency frequency,
  }) = _Routine;

  /// Create an empty object with the basic data of a [Routine]
  factory Routine.empty() {
    final time = DateTime.now();
    return Routine(
      id: const Uuid().v1(),
      smartItemId: '',
      name: '',
      turnOnTime: time,
      turnOffTime: time.add(const Duration(minutes: 10)),
      frequency: RoutineFrequency.daily,
    );
  }
}

enum RoutineFrequency { daily, weekly, monthly }
