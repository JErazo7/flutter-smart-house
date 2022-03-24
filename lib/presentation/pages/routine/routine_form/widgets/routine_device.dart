import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../domain/smart_item/smart_item.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import '../../../../core/widgets/smart_house_list_tile.dart';
import 'routine_form_inherited.dart';

class RoutineDevice extends ConsumerWidget {
  final List<SmartItem> smartItems;

  const RoutineDevice({
    Key? key,
    required this.smartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final provider = RoutineFormInherited.of(context).provider;
    final isEditing = ref.watch(provider.select((value) => value.isEditing));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
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
            builder: (context, ref, _) {
              final smartItemId = ref
                  .watch(provider.select((value) => value.routine.smartItemId));
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final smartItem = smartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SmartHouseListTile(
                        isSelected: smartItem.id == smartItemId,
                        title: smartItem.name,
                        iconId: smartItem.iconId,
                        onTap: () {
                          ref
                              .read(provider.notifier)
                              .smartItemIdUpdated(smartItem.id);
                        },
                      ),
                    );
                  },
                  childCount: smartItems.length,
                ),
              );
            },
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, ref, _) {
                  final smartItemId = ref.watch(
                    provider.select((value) => value.routine.smartItemId),
                  );

                  return SmartHouseButton(
                    text: isEditing ? 'Save' : 'Next',
                    enabled: smartItemId.isNotEmpty,
                    onPressed: () {
                      RoutineFormInherited.of(context).onNext();
                    },
                  );
                },
              ),
              if (!isEditing)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatSmartHouseButton(
                    text: 'Back',
                    onPressed: RoutineFormInherited.of(context).onPrevious,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
