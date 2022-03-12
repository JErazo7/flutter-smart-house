import 'package:dartz/dartz.dart';

import 'smart_item.dart';
import 'smart_item_failure.dart';

abstract class ISmartItemRepository {
  /// Fetch a list of [SmartItem] linked with the current user
  Future<Either<SmartItemFailure, List<SmartItem>>> fetchAll();

  /// Create a new [SmartItem]
  Future<Either<SmartItemFailure, Unit>> create(SmartItem smartItem);

  /// Update a [SmartItem]
  Future<Either<SmartItemFailure, Unit>> update(SmartItem smartItem);

  /// Remove a [SmartItem] by their id
  Future<Either<SmartItemFailure, Unit>> remove(String id);
}
