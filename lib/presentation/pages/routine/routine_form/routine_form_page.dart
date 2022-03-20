import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import 'widgets/routine_device.dart';
import 'widgets/routine_form_actions.dart';
import 'widgets/routine_name.dart';
import 'widgets/routine_settings.dart';

enum RoutineFormSection { name, device, settings }

class RoutineFormArguments {
  final RoutineFormSection sectionToEdit;
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
  late Routine _routine;
  late int pagePosition;

  final _provider = routineFormControllerProvider;

  @override
  void initState() {
    super.initState();
    final arguments = widget.arguments;

    // Initialize the provider and routine of this widget
    ref.read(_provider.notifier).initialized(arguments?.routine);
    _routine = arguments?.routine ?? Routine.empty();

    // Select the initial position of the pageView
    pagePosition = arguments?.sectionToEdit.index ?? 0;
    _pageController = PageController(initialPage: pagePosition);
  }

  @override
  Widget build(BuildContext context) {
    final currentPage = pagePosition.toString();
    final totalPages = RoutineFormSection.values.length;
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

    return Scaffold(
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
          onPageChanged: (newPosition) {
            _pagePositionUpdated(newPosition);
          },
          children: [
            RoutineName(
              nameChanged: (value) {
                ref.read(_provider.notifier).nameUpdated(value);
              },
              name: _routine.name,
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
                  deviceSelected: (id) {
                    ref.read(_provider.notifier).smartItemIdUpdated(id);
                  },
                  smartItemId: _routine.smartItemId,
                );
              },
            ),
            RoutineSettings(
              buttonAction: 'Save',
              showBackButton: !isEditing,
              frequency: _routine.frequency,
              turnOnTime: _routine.turnOnTime,
              turnOffTime: _routine.turnOffTime,
              frequencySelected: (value) {
                ref.read(_provider.notifier).frequencyUpdated(value);
              },
              turnOnTimeChoosed: (value) {
                ref.read(_provider.notifier).turnOnTimeUpdated(value);
              },
              turnOffTimeChoosed: (value) {
                ref.read(_provider.notifier).turnOffTimeUpdated(value);
              },
            )
          ],
        ),
      ),
    );
  }

  void _onNextPage() {
    final pageArrayPosition = RoutineFormSection.values.length - 1;
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
      pagePosition = position + 1;
      _routine = ref.read(_provider).routine;
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
