import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/saving_in_progress_overlay.dart';
import '../../../routes/route_name.dart';
import 'widgets/routine_device.dart';
import 'widgets/routine_form_appbar.dart';
import 'widgets/routine_form_inherited.dart';
import 'widgets/routine_name.dart';
import 'widgets/routine_settings.dart';

enum RoutineEditSection { name, device, settings }

class RoutineFormArguments {
  final RoutineEditSection sectionToEdit;
  final Routine routine;

  RoutineFormArguments({required this.sectionToEdit, required this.routine});
}

class RoutineFormPage extends ConsumerStatefulWidget {
  final RoutineFormArguments? arguments;

  const RoutineFormPage({Key? key, this.arguments}) : super(key: key);

  @override
  _RoutineFormPageState createState() => _RoutineFormPageState();
}

class _RoutineFormPageState extends ConsumerState<RoutineFormPage> {
  late final PageController _pageController;
  late int pagePosition;
  final totalPages = RoutineEditSection.values.length;

  @override
  void initState() {
    // Select the initial position of the pageView
    pagePosition = widget.arguments?.sectionToEdit.index ?? 0;
    _pageController = PageController(initialPage: pagePosition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = routineFormControllerProvider(widget.arguments?.routine);
    final currentPage = (pagePosition + 1).toString();
    final position = '$currentPage of $totalPages';

    // Listen if the routine was sent to save and got a response
    ref.listen<bool>(
      provider.select((value) => value.saveFailureOrSuccessOption.isSome()),
      ((_, isSome) {
        _handleState(context, ref, isSome);
      }),
    );

    return Stack(
      children: [
        RoutineFormInherited(
          provider: provider,
          onNext: _onNextPage,
          onPrevious: _onPreviousPage,
          child: Scaffold(
            appBar: RoutineFormAppbar(position: position),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (newPosition) {
                _pagePositionUpdated(newPosition);
              },
              children: [
                const RoutineName(),
                Consumer(
                  builder: (context, ref, child) {
                    final smartItems = ref.watch(smartItemsProvider);
                    return RoutineDevice(
                      smartItems: smartItems,
                    );
                  },
                ),
                const RoutineSettings()
              ],
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            final isSaving =
                ref.watch(provider.select((value) => value.isSaving));
            return SavingInProgressOverlay(isSaving: isSaving);
          },
        )
      ],
    );
  }

  void _onNextPage() {
    final provider = routineFormControllerProvider(widget.arguments?.routine);
    final pageArrayPosition = RoutineEditSection.values.length - 1;
    if (pagePosition == pageArrayPosition || ref.read(provider).isEditing) {
      ref.read(provider.notifier).saved();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _onPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _pagePositionUpdated(int position) {
    setState(() {
      pagePosition = position;
    });
  }

  void _handleState(
    BuildContext context,
    WidgetRef ref,
    bool isSome,
  ) {
    if (isSome) {
      final provider = routineFormControllerProvider(widget.arguments?.routine);
      final state = ref.read(provider);
      state.saveFailureOrSuccessOption.fold(
        () {},
        (either) {
          either.fold(
            (failure) {
              SmartHouseAlerts.showSnackBarError(
                context,
                'An unexpected error has occurred',
              );
            },
            (_) {
              Navigator.of(context)
                  .popUntil((route) => route.settings.name == RouteName.home);
              final msg = !state.isEditing
                  ? 'Your routine has been created'
                  : 'Your routine has been updated';

              SmartHouseAlerts.showSnackBarSuccess(context, msg);
            },
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
