import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoutineAppbar extends SliverPersistentHeaderDelegate {
  const RoutineAppbar({Key? key}) : super();

  @override
  Widget build(BuildContext context, shrinkOffset, overlapsContent) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: EdgeInsets.all(16.r).subtract(EdgeInsets.only(bottom: 4.h)),
      child: Text(
        'Routines',
        style: theme.textTheme.headline6,
      ),
    );
  }

  @override
  double get maxExtent => 50.r;

  @override
  double get minExtent => 50.r;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
