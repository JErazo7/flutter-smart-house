import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    // return Scaffold(
    //   body: Center(
    //     child: Lottie.asset(
    //       'assets/animations/chip.json',
    //       height: 180.h,
    //       width: MediaQuery.of(context).size.width,
    //     ),
    //   ),
    // );
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Hi Josue'),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: PhysicalModel(
                  color: Colors.transparent,
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(16.r),
                  child: SizedBox(
                    height: 150.h,
                    child: Swiper(
                      autoplay: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          color: Colors.amber[(index + 1) * 100]!,
                        );
                      },
                      itemCount: 3,
                      pagination: const SwiperPagination(
                          builder: SwiperPagination.dots),
                    ),
                  ),
                ),
              ),
            ),
            const DevicesAppBar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 110.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 164.w,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  itemBuilder: (context, index) {
                    return const DeviceItem();
                  },
                  itemCount: 5,
                ),
              ),
            ),
            const SliverPersistentHeader(
              delegate: RoutineAppbar(),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const RoutineWidget();
                },
                childCount: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoutineAppbar extends SliverPersistentHeaderDelegate {
  const RoutineAppbar({Key? key}) : super();

  @override
  Widget build(BuildContext context, shrinkOffset, overlapsContent) {
    final theme = Theme.of(context);
    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w)
          .subtract(EdgeInsets.only(bottom: 4.h)),
      child: Text(
        'Routines',
        style: theme.textTheme.headline6,
      ),
    );
  }

  @override
  double get maxExtent => 50.h;

  @override
  double get minExtent => 50.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class RoutineWidget extends StatelessWidget {
  const RoutineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 16.w),
      child: PhysicalModel(
        color: theme.colorScheme.secondary,
        elevation: 2.h,
        shadowColor: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(16.r),
        child: ListTile(
          title: const Text('Turn on the lights'),
          leading: CircleAvatar(
            backgroundColor: theme.primaryColor,
            radius: 18.r,
            child: Icon(
              Icons.light_outlined,
              color: Colors.white,
              size: 20.r,
            ),
          ),
          trailing: Switch(
            activeTrackColor: theme.primaryColor,
            activeColor: Colors.white,
            value: true,
            onChanged: (_) {},
          ),
        ),
      ),
    );
  }
}

class DeviceItem extends StatelessWidget {
  const DeviceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Icon(
                      Icons.light_outlined,
                      size: 32.r,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 72.w,
                    ),
                    child: Text(
                      'Lights',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: theme.textTheme.subtitle1,
                    ),
                  )
                ],
              ),
              Switch(
                activeTrackColor: theme.primaryColor,
                activeColor: Colors.white,
                value: true,
                onChanged: (_) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DevicesAppBar extends StatelessWidget {
  const DevicesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w)
            .subtract(EdgeInsets.only(bottom: 8.h)),
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
