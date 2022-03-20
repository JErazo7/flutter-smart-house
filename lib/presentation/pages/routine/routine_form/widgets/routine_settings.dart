import 'package:flutter/material.dart';

import '../../../../../domain/routine/routine.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_actions.dart';

class RoutineSettings extends StatelessWidget {
  final RoutineFrequency frequency;
  final String buttonAction;
  final bool showBackButton;
  final DateTime turnOnTime;
  final DateTime turnOffTime;
  final void Function(RoutineFrequency) frequencySelected;
  final void Function(DateTime) turnOnTimeChoosed;
  final void Function(DateTime) turnOffTimeChoosed;

  const RoutineSettings({
    Key? key,
    required this.buttonAction,
    required this.showBackButton,
    required this.frequency,
    required this.turnOnTime,
    required this.turnOffTime,
    required this.frequencySelected,
    required this.turnOnTimeChoosed,
    required this.turnOffTimeChoosed,
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
                text: buttonAction,
                onPressed: () {
                  RoutineFormActions.of(context).onNext();
                },
              ),
              if (showBackButton)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FlatSmartHouseButton(
                    text: 'Back',
                    onPressed: RoutineFormActions.of(context).onPrevious,
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
