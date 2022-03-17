import 'package:flutter/material.dart';

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding:
            const EdgeInsets.all(16).subtract(const EdgeInsets.only(bottom: 8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Devices',
              style: textTheme.headline5,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                'See all',
                style: textTheme.headline6?.copyWith(
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
