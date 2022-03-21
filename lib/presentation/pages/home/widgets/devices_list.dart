import 'package:flutter/material.dart';

import '../../../../domain/smart_item/smart_item.dart';
import '../../../core/utils/utils.dart';

class DevicesList extends StatelessWidget {
  final List<SmartItem> devices;

  const DevicesList(this.devices, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 190,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            final device = devices[index];
            return DeviceItem(device);
          },
          itemCount: devices.length,
        ),
      ),
    );
  }
}

class DeviceItem extends StatelessWidget {
  final SmartItem device;

  const DeviceItem(this.device, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconData = getIconDataFromId(device.iconId);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PhysicalModel(
        color: theme.colorScheme.secondary,
        elevation: 2,
        shadowColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding:
              const EdgeInsets.all(16).subtract(const EdgeInsets.only(top: 8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Icon(
                        iconData,
                        size: 32,
                      ),
                    ),
                    Text(
                      device.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.headline6,
                    )
                  ],
                ),
              ),
              Switch(
                activeTrackColor: theme.primaryColor,
                activeColor: Colors.white,
                value: device.state == SmartItemState.on,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
