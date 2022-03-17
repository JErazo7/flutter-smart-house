import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import 'widgets/routine_device.dart';
import 'widgets/routine_name.dart';

enum RoutineFormSection { name, device, settings }

class RoutineFormArguments {
  final RoutineFormSection editSection;
  final Routine routine;

  RoutineFormArguments({required this.editSection, required this.routine});
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
  late final AutoDisposeStateNotifierProvider<RoutineFormController,
      RoutineFormState> _provider;

  @override
  void initState() {
    super.initState();
    final arguments = widget.arguments;
    _provider = routineFormControllerProvider(widget.arguments?.routine);
    pagePosition = arguments?.editSection.index ?? 0;
    _pageController = PageController(initialPage: pagePosition);
  }

  @override
  Widget build(BuildContext context) {
    final position =
        '${(pagePosition + 1).toString()} of ${RoutineFormSection.values.length}';
    final routine = widget.arguments?.routine;

    // listen only if the routine was sent to save and got a response
    ref.listen<bool>(
      _provider.select((value) => value.saveFailureOrSuccessOption.isSome()),
      ((_, isSome) {
        _handeState(context, ref, isSome);
      }),
    );

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (widget.arguments == null)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(position,
                    style: Theme.of(context).textTheme.headline6),
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
            validated: _onNextPage,
            onChanged: (value) {
              ref.read(_provider.notifier).nameUpdated(value);
            },
            name: 'Josue',
            isEditing: false,
          ),
          RoutineDevice(
            onPrevious: _onPreviousPage,
            validated: () {},
            deviceId: routine?.smartItemId,
          ),
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
