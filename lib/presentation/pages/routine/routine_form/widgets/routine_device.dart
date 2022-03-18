import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../../application/smart_item/smart_item_provider.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';

class RoutineDevice extends StatelessWidget {
  final VoidCallback onPrevious;
  final VoidCallback validated;

  RoutineDevice({
    Key? key,
    required this.onPrevious,
    required this.validated,
  }) : super(key: key);

  final _provider = routineFormControllerProvider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(_provider);

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmartHouseButton(
                    text: state.isEditing ? 'Save' : 'Next',
                    onPressed:
                        state.routine.smartItemId.isNotEmpty ? () {} : null,
                  ),
                  if (!state.isEditing)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: FlatSmartHouseButton(
                        text: 'Back',
                        onPressed: onPrevious,
                      ),
                    )
                ],
              );
            },
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Choose a device',
                    style: theme.textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Choose a device to link your routine',
                      style: theme.textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              final devices = ref.watch(smartItemsProvider);
              final smartItemId = ref.watch(_provider).routine.smartItemId;

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final device = devices[index];
                    return DeviceListItem(
                      isSelected: device.id == smartItemId,
                      name: device.name,
                      iconId: device.iconId,
                      onTap: () {
                        onSmartItemTaped(ref, device.id);
                      },
                    );
                  },
                  childCount: devices.length,
                ),
              );
            },
          )
        ],
      ),
    );
  }

  void onSmartItemTaped(WidgetRef ref, String id) {
    ref.read(_provider.notifier).smartItemIdUpdated(id);
  }
}

class DeviceListItem extends StatelessWidget {
  final String name;
  final bool isSelected;
  final int? iconId;
  final VoidCallback onTap;

  const DeviceListItem({
    Key? key,
    this.iconId,
    required this.name,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconData = IconData(
      iconId ?? 61795,
      fontFamily: 'MaterialIcons',
    );
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: PhysicalModel(
          color: theme.colorScheme.secondary,
          elevation: isSelected ? 6 : 2,
          shadowColor:
              isSelected ? theme.primaryColor : theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
          child: ListTile(
            selected: isSelected,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(
              name,
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
          ),
        ),
      ),
    );
  }
}
