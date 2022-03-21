import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

class RoutineDetailModal extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final icon = getIconDataFromId(inconId);

    return Stack(
      children: [
        Column(
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
              onPressed: () {},
            )
          ],
        ),
        const ModalSavingProgressOverlay(isSaving: false)
      ],
    );
  }

  void _editRoutine(
    BuildContext context, {
    required RoutineEditSection section,
  }) {
    GoRouter.of(context).pushNamed(
      RouteName.routineForm,
      extra: RoutineFormArguments(
        sectionToEdit: section,
        routine: routine,
      ),
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
