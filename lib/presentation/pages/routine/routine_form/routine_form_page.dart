import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/saving_in_progress_overlay.dart';
import 'widgets/routine_device.dart';
import 'widgets/routine_form_actions.dart';
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

  final _provider = routineFormControllerProvider;

  @override
  void initState() {
    super.initState();
    // Initialize the provider and routine of this widget
    final arguments = widget.arguments;

    ref.read(_provider.notifier).initialized(arguments?.routine);

    // Select the initial position of the pageView
    pagePosition = arguments?.sectionToEdit.index ?? 0;
    _pageController = PageController(initialPage: pagePosition);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = (pagePosition + 1).toString();
    final totalPages = RoutineEditSection.values.length;
    final position = '$currentPage of $totalPages';

    final isEditing = widget.arguments != null;
    final buttonActionText = isEditing ? 'Save' : 'Next';

    // Listen if the routine was sent to save and got a response
    ref.listen<bool>(
      _provider.select((value) => value.saveFailureOrSuccessOption.isSome()),
      ((_, isSome) {
        _handeState(context, ref, isSome);
      }),
    );

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
            actions: [
              if (!isEditing)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      position,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                )
            ],
          ),
          body: RoutineFormActions(
            onNext: _onNextPage,
            onPrevious: _onPreviousPage,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (newPosition) {
                _pagePositionUpdated(newPosition);
              },
              children: [
                RoutineName(
                  showBackButton: false,
                  buttonAction: buttonActionText,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final smartItems = ref.watch(smartItemsProvider);
                    return RoutineDevice(
                      showBackButton: !isEditing,
                      buttonAction: buttonActionText,
                      smartItems: smartItems,
                    );
                  },
                ),
                RoutineSettings(
                  buttonAction: 'Save',
                  showBackButton: !isEditing,
                )
              ],
            ),
          ),
        ),
        Consumer(
          builder: (context, ref, _) {
            final isSaving =
                ref.watch(_provider.select((value) => value.isSaving));
            return SavingInProgressOverlay(isSaving: isSaving);
          },
        )
      ],
    );
  }

  void _onNextPage() {
    final pageArrayPosition = RoutineEditSection.values.length - 1;
    if (pagePosition == pageArrayPosition || ref.read(_provider).isEditing) {
      ref.read(_provider.notifier).saved();
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

  void _handeState(
    BuildContext context,
    WidgetRef ref,
    bool isSome,
  ) {
    if (isSome) {
      final state = ref.read(_provider);
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
              SmartHouseAlerts.showSnackBarSuccess(
                context,
                'Yout routine has been created',
              );
              Navigator.of(context).pop();
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
