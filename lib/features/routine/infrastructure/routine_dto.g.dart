// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routine_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoutineDto _$$_RoutineDtoFromJson(Map<String, dynamic> json) =>
    _$_RoutineDto(
      id: json['id'] as String,
      name: json['name'] as String,
      turnOnTime: DateTime.parse(json['turnOnTime'] as String),
      turnOffTime: DateTime.parse(json['turnOffTime'] as String),
      frequency: json['frequency'] as String,
    );

Map<String, dynamic> _$$_RoutineDtoToJson(_$_RoutineDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'turnOnTime': instance.turnOnTime.toIso8601String(),
      'turnOffTime': instance.turnOffTime.toIso8601String(),
      'frequency': instance.frequency,
    };
