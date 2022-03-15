// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutineDto _$$_RoutineDtoFromJson(Map<String, dynamic> json) =>
    _$_RoutineDto(
      id: json['id'] as String,
      smartItemId: json['smartItemId'] as String,
      name: json['name'] as String,
      turnOnTime: const ServerTimestampConverter()
          .fromJson(json['turnOnTime'] as Timestamp),
      turnOffTime: const ServerTimestampConverter()
          .fromJson(json['turnOffTime'] as Timestamp),
      frequency: json['frequency'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$_RoutineDtoToJson(_$_RoutineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'smartItemId': instance.smartItemId,
      'name': instance.name,
      'turnOnTime':
          const ServerTimestampConverter().toJson(instance.turnOnTime),
      'turnOffTime':
          const ServerTimestampConverter().toJson(instance.turnOffTime),
      'frequency': instance.frequency,
      'state': instance.state,
    };
