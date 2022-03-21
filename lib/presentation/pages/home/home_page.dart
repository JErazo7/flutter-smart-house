import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../application/routine/routine_watcher/routine_watcher_notifier.dart';
import '../../../application/smart_item/smart_item_provider.dart';
import '../../../domain/routine/routine.dart';
import '../../../domain/smart_item/smart_item.dart';
import '../../core/utils/resources.dart';
import '../../core/widgets/smart_house_button.dart';
import '../../routes/route_name.dart';
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
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Hi Josue'),
            ),
            const CarouselSection(),
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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SmartHouseButton(
            text: 'Create Routine',
            onPressed: () {
              context.pushNamed(
                RouteName.routineForm,
                // extra: RoutineFormArguments(
                //   sectionToEdit: RoutineEditSection.name,
                //   routine: Routine.empty().copyWith(name: 'Josue'),
                // ),
              );
            },
          ),
        ),
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
