import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'smart_item.freezed.dart';

@freezed
class SmartItem with _$SmartItem {
  factory SmartItem({
    /// Unique identifier
    required String id,

    /// The SmartItem name
    required String name,

    /// The SmartItem type [device, service]
    required SmartItemType type,

    /// The SmartItem state [on, off]
    required SmartItemState state,

    /// Icon to indentify the SmartItem
    String? icon,
  }) = _SmartItem;

  /// Create an empty object with the basic data of a [SmartItem]
  factory SmartItem.empty() {
    return SmartItem(
      id: const Uuid().v1(),
      name: '',
      type: SmartItemType.device,
      state: SmartItemState.off,
    );
  }
}

enum SmartItemType { device, service }
enum SmartItemState { on, off }
