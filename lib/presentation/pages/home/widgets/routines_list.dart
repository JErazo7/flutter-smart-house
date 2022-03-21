import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/widgets/smart_house_list_tile.dart';
import '../../routine/routine_detail/routine_detail_modal.dart';

class RotuinesList extends ConsumerWidget {
  final List<Routine> routines;

  const RotuinesList(this.routines, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final routine = routines[index];
          final device = ref.watch(deviceByIdProvider(routine.smartItemId));
          return SmartHouseListTile(
            title: routine.name,
            iconId: device.iconId,
            onTap: () {
              showRoutineDetailModal(
                context,
                routine: routine,
                inconId: device.iconId,
                smartItemName: device.name,
              );
            },
          );
        },
        childCount: routines.length,
      ),
    );
  }
}
