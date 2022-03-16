import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/smart_item/smart_item.dart';

class DevicesList extends StatelessWidget {
  final List<SmartItem> devices;

  const DevicesList(this.devices, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 120.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 170.r,
          padding: EdgeInsets.all(8.r),
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
    final iconData = IconData(
      device.iconId ?? 61795,
      fontFamily: 'MaterialIcons',
    );

    return Container(
      // width: 160.w,
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: PhysicalModel(
        color: theme.colorScheme.secondary,
        elevation: 2.h,
        shadowColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.all(16.r).subtract(EdgeInsets.only(top: 8.r)),
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
                      padding: EdgeInsets.only(top: 4.h),
                      child: Icon(
                        iconData,
                        size: 30.r,
                      ),
                    ),
                    Text(
                      device.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.subtitle1,
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
