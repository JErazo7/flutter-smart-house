import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../application/routine/routine_watcher/routine_watcher_notifier.dart';
import '../../../application/smart_item/smart_item_provider.dart';
import '../../../domain/routine/routine.dart';
import '../../../domain/smart_item/smart_item.dart';
import '../../core/utils/resources.dart';
import '../../core/utils/utils.dart';
import '../../core/widgets/smart_house_button.dart';
import '../../routes/route_name.dart';
import '../routine/routine_form/routine_form_page.dart';
import 'widgets/carousel_section.dart';
import 'widgets/devices_appbar.dart';
import 'widgets/devices_list.dart';
import 'widgets/routines_appbar.dart';
import 'widgets/routines_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final smartItemsState = ref.watch(smartItemFutureProvider);
    final routinesState = ref.watch(routineNotifierProvider);
    // If there is an error, it returns a error page
    if (smartItemsState is AsyncError || routinesState is Error) {
      return HomeError(
        onRetry: () {
          _onRetry(ref);
        },
      );
    }

    // If all the data is loaded, it returns a data page
    if (smartItemsState is AsyncData && routinesState is Data) {
      return HomeData(
        routines: routinesState.routines,
        smartItems: smartItemsState.asData!.value,
      );
    }

    return const HomeLoading();
  }

  void _onRetry(WidgetRef ref) {
    ref.read(routineNotifierProvider.notifier).watchAllStarted();
    ref.refresh(smartItemFutureProvider);
  }
}

class HomeData extends StatelessWidget {
  final List<Routine> routines;
  final List<SmartItem> smartItems;

  const HomeData({
    Key? key,
    required this.routines,
    required this.smartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveWrapper.of(context);
    if (responsive.isDesktop) {
      return HomeDataDesktop(
        routines: routines,
        smartItems: smartItems,
      );
    }
    return HomeDataMobileTablet(
      routines: routines,
      smartItems: smartItems,
    );
  }
}

class HomeDataMobileTablet extends StatelessWidget {
  final List<Routine> routines;
  final List<SmartItem> smartItems;

  const HomeDataMobileTablet({
    Key? key,
    required this.routines,
    required this.smartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveWrapper.of(context);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            if (!responsive.isDesktop)
              const SliverPadding(
                padding: EdgeInsets.only(top: 16),
                sliver: SliverAppBar(
                  title: Text('Hi Josue'),
                ),
              ),
            if (!responsive.isDesktop)
              const SliverToBoxAdapter(child: CarouselSection()),
            const DevicesAppBar(),
            DevicesList(smartItems),
            const SliverPersistentHeader(
              delegate: RoutineAppbar(),
              pinned: true,
              floating: true,
            ),
            RotuinesList(routines)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: responsive.isDesktop ? 0 : null,
        color: responsive.isDesktop ? Colors.transparent : null,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SmartHouseButton(
            text: 'Create Routine',
            onPressed: () {
              if (responsive.isDesktop) {
                showModal(
                  context: context,
                  child: const RoutineFormPage(),
                );
              } else {
                context.pushNamed(RouteName.routineForm);
              }
            },
          ),
        ),
      ),
    );
  }
}

class HomeDataDesktop extends StatelessWidget {
  final List<Routine> routines;
  final List<SmartItem> smartItems;

  const HomeDataDesktop({
    Key? key,
    required this.routines,
    required this.smartItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Material(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        'Hola Josue',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    const Expanded(child: CarouselSection()),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: HomeDataMobileTablet(
              routines: routines,
              smartItems: smartItems,
            ),
          )
        ],
      ),
    );
  }
}

class HomeError extends StatelessWidget {
  final VoidCallback onRetry;

  const HomeError({Key? key, required this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Lottie.asset(
              LottieAnimations.loading,
              height: 180,
              width: MediaQuery.of(context).size.width,
            ),
            Text(
              'Something went wrong',
              style: theme.textTheme.subtitle1,
            ),
            const Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SmartHouseButton(
                text: 'Retry',
                onPressed: onRetry,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          LottieAnimations.loading,
          height: 180,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
