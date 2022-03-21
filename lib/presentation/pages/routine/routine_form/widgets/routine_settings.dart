import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/routine/routine.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_inherited.dart';

class RoutineSettings extends ConsumerWidget {
  const RoutineSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);
    final provider = RoutineFormInherited.of(context).provider;
    final controller = ref.read(provider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose a configuration',
                style: theme.textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Set your personal preferences',
                  style: theme.textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  '1. Frequency',
                  style: theme.textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Consumer(
                    builder: (context, ref, _) {
                      final frequency = ref.watch(
                        provider.select((value) => value.routine.frequency),
                      );
                      return CupertinoSlidingSegmentedControl<RoutineFrequency>(
                        key: const Key('sliding_segmented_control'),
                        onValueChanged: (frequency) {
                          controller.frequencyUpdated(frequency!);
                        },
                        groupValue: frequency,
                        children: const {
                          RoutineFrequency.daily: Text('Daily'),
                          RoutineFrequency.weekly: Text('Weekly'),
                          RoutineFrequency.monthly: Text('Monthly'),
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (context, ref, _) {
                  final turnOnTime = ref.watch(
                    provider.select((value) => value.routine.turnOnTime),
                  );
                  return TimeSelector(
                    title: '2. What time should it be turned on?',
                    time: turnOnTime,
                    onChanged: controller.turnOnTimeUpdated,
                  );
                },
              ),
              const SizedBox(height: 16),
              Consumer(
                builder: (context, ref, _) {
                  final turnOffTime = ref.watch(
                    provider.select((value) => value.routine.turnOffTime),
                  );
                  return TimeSelector(
                    title: '3. What time should it be turned off?',
                    time: turnOffTime,
                    onChanged: controller.turnOffTimeUpdated,
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartHouseButton(
                text: 'Save',
                onPressed: RoutineFormInherited.of(context).onNext,
              ),
              Consumer(
                builder: (context, ref, child) {
                  final isEditing =
                      ref.watch(provider.select((value) => value.isEditing));
                  if (isEditing) return const SizedBox();
                  return child!;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatSmartHouseButton(
                    text: 'Back',
                    onPressed: RoutineFormInherited.of(context).onPrevious,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSelector extends StatelessWidget {
  final String title;
  final DateTime time;
  final void Function(DateTime) onChanged;

  const TimeSelector({
    Key? key,
    required this.time,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final languageCode = Localizations.localeOf(context).languageCode;
    final formatedTime = DateFormat.jm(languageCode).format(time);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            title,
            style: theme.textTheme.subtitle1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            radius: 0,
            onTap: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: TimeOfDay.fromDateTime(time),
                  cancelText: 'Cancel',
                  okText: 'Ok',
                  onChange: (time) {
                    final dateTime = DateTime.now().fromTimeOfDay(time);
                    onChanged(dateTime);
                  },
                  okStyle: theme.textTheme.headline6!
                      .copyWith(color: theme.primaryColor),
                  cancelStyle: theme.textTheme.headline6!,
                  accentColor: theme.primaryColor,
                ),
              );
            },
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatedTime,
                      style: theme.textTheme.subtitle1
                          ?.copyWith(fontWeight: FontWeight.normal),
                    ),
                    const Icon(Icons.alarm),
                  ],
                ),
                const Divider(thickness: 2)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
