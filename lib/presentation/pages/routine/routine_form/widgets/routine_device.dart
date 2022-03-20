import 'package:flutter/material.dart';

import '../../../../../domain/smart_item/smart_item.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_actions.dart';

class RoutineDevice extends StatefulWidget {
  final String? smartItemId;
  final String buttonAction;
  final bool showBackButton;
  final List<SmartItem> smartItems;
  final void Function(String) deviceSelected;

  const RoutineDevice({
    Key? key,
    required this.smartItems,
    required this.deviceSelected,
    required this.smartItemId,
    required this.buttonAction,
    required this.showBackButton,
  }) : super(key: key);

  @override
  State<RoutineDevice> createState() => _RoutineDeviceState();
}

class _RoutineDeviceState extends State<RoutineDevice> {
  String? _smartItemId;
  @override
  void initState() {
    _smartItemId = widget.smartItemId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartHouseButton(
                text: widget.buttonAction,
                onPressed: () {
                  RoutineFormActions.of(context).onNext();
                },
              ),
              if (widget.showBackButton)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatSmartHouseButton(
                    text: 'Back',
                    onPressed: RoutineFormActions.of(context).onPrevious,
                  ),
                )
            ],
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final smartItem = widget.smartItems[index];
                return DeviceListItem(
                  isSelected: smartItem.id == _smartItemId,
                  name: smartItem.name,
                  iconId: smartItem.iconId,
                  onTap: () {
                    widget.deviceSelected(smartItem.id);
                    setState(() {
                      _smartItemId = smartItem.id;
                    });
                  },
                );
              },
              childCount: widget.smartItems.length,
            ),
          )
        ],
      ),
    );
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
