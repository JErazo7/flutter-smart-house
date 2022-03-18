import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../application/smart_item/smart_item_provider.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import 'widgets/routine_device.dart';
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
    ref.read(_provider.notifier).initialized(arguments?.routine);
    _routine = arguments?.routine ?? Routine.empty();
    pagePosition = arguments?.sectionToEdit.index ?? 0;
    _pageController = PageController(initialPage: pagePosition);
  }

  @override
  Widget build(BuildContext context) {
    final position =
        '${(pagePosition + 1).toString()} of ${RoutineFormSection.values.length}';

    final isEditing = widget.arguments != null;

    // listen only if the routine was sent to save and got a response
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (newPosition) {
          _pagePositionUpdated(newPosition);
        },
        children: [
          RoutineName(
            nameChanged: (value) {
              ref.read(_provider.notifier).nameUpdated(value);
            },
            onNext: _onNextPage,
            onSave: _saved,
            name: _routine.name,
            isEditing: isEditing,
          ),
          Consumer(
            builder: (context, ref, child) {
              final smartItems = ref.watch(smartItemsProvider);
              return RoutineDevice(
                isEditing: isEditing,
                onNext: _onNextPage,
                onPrevious: _onPreviousPage,
                smartItems: smartItems,
                onSave: _saved,
                onSelected: (id) {
                  ref.read(_provider.notifier).smartItemIdUpdated(id);
                },
                smartItemId: _routine.smartItemId,
              );
            },
          ),
          RoutineSettings(
            isEditing: isEditing,
            frequency: _routine.frequency,
            turnOnTime: _routine.turnOnTime,
            turnOffTime: _routine.turnOffTime,
            onPrevious: _onPreviousPage,
            onSave: _saved,
            onFrequencySelected: (value) {},
            onturnOnTimeChoosed: (value) {},
            onturnOffTimeChoosed: (value) {},
          )
        ],
      ),
    );
  }

  void _onNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _onPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _saved() {
    ref.read(_provider.notifier).saved();
  }

  void _pagePositionUpdated(int position) {
    setState(() {
      pagePosition = position;
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
