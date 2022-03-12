import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/smart_item/i_smart_item_repository.dart';
import '../../domain/smart_item/smart_item.dart';
import '../../domain/smart_item/smart_item_failure.dart';
import '../core/firebase_services.dart';
import '../core/firestore_helpers.dart';
import 'smart_item_dto.dart';

final smartItemRepositoryProvider = Provider.autoDispose((ref) {
  final firestore = ref.watch(firestoreProvider);
  return SmartItemRepository(firestore);
});

class SmartItemRepository extends ISmartItemRepository {
  final FirebaseFirestore _firestore;

  SmartItemRepository(this._firestore);

  @override
  Future<Either<SmartItemFailure, List<SmartItem>>> fetchAll() async {
    try {
      final reference = _firestore.smartItemCollection;
      final querySnapshot = await reference.get();
      final smartItems = querySnapshot.docs.map((doc) {
        final json = doc.data() as Map<String, dynamic>;
        final smartItem = SmartItemDto.fromJson(json).toDomain();
        return smartItem;
      }).toList();
      return right(smartItems);
    } on FirebaseException catch (_) {
      return left(SmartItemFailure.serverError());
    } on Exception catch (_) {
      return left(SmartItemFailure.unexpected());
    }
  }

  @override
  Future<Either<SmartItemFailure, Unit>> create(SmartItem smartItem) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<SmartItemFailure, Unit>> remove(String id) {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<Either<SmartItemFailure, Unit>> update(SmartItem smartItem) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
