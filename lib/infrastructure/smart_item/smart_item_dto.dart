import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/smart_item/smart_item.dart';

part 'smart_item_dto.freezed.dart';
part 'smart_item_dto.g.dart';

@freezed
class SmartItemDto with _$SmartItemDto {
  SmartItemDto._();

  factory SmartItemDto({
    required String id,
    required String name,
    required String type,
    required String state,
    String? icon,
  }) = _SmartItemDto;

  /// Create a [SmartItemDto] object from a [SmartItem]
  factory SmartItemDto.fromDomain(SmartItem smartItem) {
    return SmartItemDto(
      id: smartItem.id,
      name: smartItem.name,
      type: describeEnum(smartItem.type),
      state: describeEnum(smartItem.state),
      icon: smartItem.icon,
    );
  }

  /// Create a [SmartItem] object from a [SmartItemDto]
  SmartItem toDomain() {
    return SmartItem(
      id: id,
      name: name,
      type: SmartItemType.values.firstWhere(
        (element) => describeEnum(element) == type,
        orElse: () => SmartItemType.device,
      ),
      state: SmartItemState.values.firstWhere(
        (element) => describeEnum(element) == type,
        orElse: () => SmartItemState.off,
      ),
    );
  }

  factory SmartItemDto.fromJson(Map<String, dynamic> json) =>
      _$SmartItemDtoFromJson(json);
}
