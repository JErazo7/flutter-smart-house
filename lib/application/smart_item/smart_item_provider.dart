import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/smart_item/smart_item.dart';
import '../../infrastructure/smart_item/smart_item_repository.dart';

final smartItemProvider = FutureProvider.autoDispose<List<SmartItem>>(
  (ref) async {
    final repository = ref.watch(smartItemRepositoryProvider);
    final response = await repository.fetchAll();
    return response.fold((f) => throw f, (smartItems) => smartItems);
  },
);