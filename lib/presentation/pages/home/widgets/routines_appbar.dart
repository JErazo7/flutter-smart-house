import 'package:flutter/material.dart';

class RoutineAppbar extends SliverPersistentHeaderDelegate {
  const RoutineAppbar({Key? key}) : super();

  @override
  Widget build(BuildContext context, shrinkOffset, overlapsContent) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding:
          const EdgeInsets.all(16).subtract(const EdgeInsets.only(bottom: 8)),
      child: Text(
        'Routines',
        style: theme.textTheme.headline5,
      ),
    );
  }

  @override
  double get maxExtent => 52;

  @override
  double get minExtent => 52;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
