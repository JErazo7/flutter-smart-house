import 'package:flutter/material.dart';

import '../../../../../domain/routine/routine.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';

class RoutineSettings extends StatelessWidget {
  final bool isEditing;
  final RoutineFrequency frequency;
  final DateTime turnOnTime;
  final DateTime turnOffTime;
  final VoidCallback onPrevious;
  final VoidCallback onSave;
  final void Function(RoutineFrequency) onFrequencySelected;
  final void Function(DateTime) onturnOnTimeChoosed;
  final void Function(DateTime) onturnOffTimeChoosed;

  const RoutineSettings({
    Key? key,
    required this.isEditing,
    required this.frequency,
    required this.turnOnTime,
    required this.turnOffTime,
    required this.onPrevious,
    required this.onSave,
    required this.onFrequencySelected,
    required this.onturnOnTimeChoosed,
    required this.onturnOffTimeChoosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartHouseButton(
                text: 'Save',
                onPressed: () {
                  onSave();
                },
              ),
              if (!isEditing)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatSmartHouseButton(
                    text: 'Back',
                    onPressed: onPrevious,
                  ),
                )
            ],
          ),
        ),
      ),
      body: const Center(
        child: Text('Ya casi'),
      ),
    );
  }
}
