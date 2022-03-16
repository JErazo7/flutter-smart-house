import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(16.r).subtract(EdgeInsets.only(bottom: 8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Devices',
              style: textTheme.headline6,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See all',
                style: textTheme.subtitle1?.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
