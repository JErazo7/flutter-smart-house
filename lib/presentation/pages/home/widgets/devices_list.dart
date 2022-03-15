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
        height: 110.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 164.w,
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: PhysicalModel(
        color: theme.colorScheme.secondary,
        elevation: 2.h,
        shadowColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.h,
            horizontal: 16.w,
          ).subtract(EdgeInsets.only(top: 8.h)),
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
                        size: 32.r,
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
