import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';

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
          return RoutineItem(
            routine,
            iconId: device.iconId,
          );
        },
        childCount: routines.length,
      ),
    );
  }
}

class RoutineItem extends StatelessWidget {
  final Routine routine;
  final int? iconId;

  const RoutineItem(this.routine, {Key? key, this.iconId = 61795})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconData = IconData(
      iconId!,
      fontFamily: 'MaterialIcons',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: PhysicalModel(
        color: theme.colorScheme.secondary,
        elevation: 2,
        shadowColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          title: Text(
            routine.name,
            style: theme.textTheme.headline6
                ?.copyWith(fontWeight: FontWeight.w500),
          ),
          leading: CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 18,
            child: Icon(
              iconData,
              color: Colors.white,
              size: 18,
            ),
          ),
          trailing: Switch(
            activeTrackColor: theme.primaryColor,
            activeColor: Colors.white,
            value: routine.state == RoutineState.enable,
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }
}
