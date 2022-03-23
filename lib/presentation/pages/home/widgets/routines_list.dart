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
    if (routines.isEmpty) {
      return SliverToBoxAdapter(
        child: SizedBox(
          height: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Icon(
                Icons.pending_actions,
                size: 52,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'There is not routines yet',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              )
            ],
          ),
        ),
      );
    }
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
