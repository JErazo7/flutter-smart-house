import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../application/routine/routine_eliminator/routine_eliminator_controller.dart';
import '../../../../domain/routine/routine.dart';
import '../../../core/utils/utils.dart';
import '../../../core/widgets/smart_house_button.dart';
import '../../../routes/route_name.dart';
import '../routine_form/routine_form_page.dart';

void showRoutineDetailModal(
  BuildContext context, {
  required Routine routine,
  required int inconId,
  required String smartItemName,
}) {
  showModal(
    context: context,
    child: RoutineDetailModal(
      routine,
      inconId: inconId,
      smartItemName: smartItemName,
    ),
  );
}

class RoutineDetailModal extends ConsumerWidget {
  final Routine routine;
  final int inconId;
  final String smartItemName;

  const RoutineDetailModal(
    this.routine, {
    Key? key,
    required this.inconId,
    required this.smartItemName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final icon = getIconDataFromId(inconId);
    final provider = routineEliminatorControllerProvider;

    ref.listen<RoutineEliminatorState>(
      provider,
      ((_, state) {
        _handleState(context, ref, state);
      }),
    );

    return Material(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: theme.primaryColor,
                  radius: 36,
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      routine.name,
                      style: theme.textTheme.headline5,
                    ),
                    const SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        _editRoutine(context, section: RoutineEditSection.name);
                      },
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blueGrey,
                      ),
                    )
                  ],
                ),
                const Divider(thickness: 2, height: 32),
                RoutineSettingItem(
                  property: 'Smart Item',
                  value: smartItemName,
                  onEdit: () {
                    _editRoutine(context, section: RoutineEditSection.device);
                  },
                ),
                RoutineSettingItem(
                  property: 'Turn on',
                  value: getFormattedTime(context, routine.turnOnTime),
                  onEdit: () {
                    _editRoutine(context, section: RoutineEditSection.settings);
                  },
                ),
                RoutineSettingItem(
                  property: 'Turn off',
                  value: getFormattedTime(context, routine.turnOffTime),
                  onEdit: () {
                    _editRoutine(context, section: RoutineEditSection.settings);
                  },
                ),
                RoutineSettingItem(
                  property: 'Frequency',
                  value: describeEnum(routine.frequency),
                  onEdit: () {
                    _editRoutine(context, section: RoutineEditSection.settings);
                  },
                ),
                const SizedBox(height: 32),
                SmartHouseButton(
                  text: 'Delete',
                  onPressed: () {
                    ref.read(provider.notifier).deleted(routine.id);
                  },
                )
              ],
            ),
          ),
          Consumer(
            builder: (context, ref, _) {
              final state = ref.watch(provider);
              final bool isDeleting = state is ActionInProgress;

              return ModalSavingProgressOverlay(
                isSaving: isDeleting,
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            padding: const EdgeInsets.all(32),
            splashRadius: 0.1,
            icon: const Icon(Icons.close),
          )
        ],
      ),
    );
  }

  void _editRoutine(
    BuildContext context, {
    required RoutineEditSection section,
  }) {
    final responsive = ResponsiveWrapper.of(context);
    final arguments = RoutineFormArguments(
      sectionToEdit: section,
      routine: routine,
    );
    if (responsive.isDesktop) {
      showModal(
        context: context,
        child: RoutineFormPage(arguments: arguments),
      );
    } else {
      GoRouter.of(context).pushNamed(
        RouteName.routineForm,
        extra: arguments,
      );
    }
  }

  void _handleState(
    BuildContext context,
    WidgetRef ref,
    RoutineEliminatorState state,
  ) {
    state.maybeWhen(
      deleteFailure: (_) {
        Navigator.pop(context);
        SmartHouseAlerts.showSnackBarError(
          context,
          'An unexpected error has occurred',
        );
      },
      deleteSuccess: () {
        Navigator.pop(context);
        SmartHouseAlerts.showSnackBarSuccess(
          context,
          'Your routine has been deleted',
        );
      },
      orElse: () {},
    );
  }
}

class RoutineSettingItem extends StatelessWidget {
  final String property;
  final String value;
  final VoidCallback? onEdit;

  const RoutineSettingItem({
    Key? key,
    required this.property,
    required this.value,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            property,
            style: theme.textTheme.headline6,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value,
                    style: theme.textTheme.subtitle1
                        ?.copyWith(fontWeight: FontWeight.normal),
                    maxLines: 1,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 24),
                InkWell(
                  onTap: onEdit,
                  child: const Icon(
                    Icons.edit,
                    color: Colors.blueGrey,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ModalSavingProgressOverlay extends StatelessWidget {
  final bool isSaving;
  const ModalSavingProgressOverlay({Key? key, required this.isSaving})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !isSaving,
        child: Container(
          decoration: BoxDecoration(
            color: isSaving
                ? Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5)
                : Colors.transparent,
          ),
          child: Visibility(
            visible: isSaving,
            child: const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
