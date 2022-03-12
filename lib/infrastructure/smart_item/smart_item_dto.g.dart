// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SmartItemDto _$$_SmartItemDtoFromJson(Map<String, dynamic> json) =>
    _$_SmartItemDto(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      state: json['state'] as String,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_SmartItemDtoToJson(_$_SmartItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'state': instance.state,
      'icon': instance.icon,
    };
