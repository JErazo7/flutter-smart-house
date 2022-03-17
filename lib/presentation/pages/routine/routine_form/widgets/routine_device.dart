import 'package:flutter/material.dart';

import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';

class RoutineDevice extends StatelessWidget {
  final String? deviceId;
  final VoidCallback onPrevious;
  final VoidCallback validated;

  const RoutineDevice({
    Key? key,
    this.deviceId,
    required this.onPrevious,
    required this.validated,
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
                text: deviceId != null ? 'Save' : 'Next',
                onPressed: () {},
              ),
              if (deviceId == null)
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
        child: Text('hola'),
      ),
    );
  }
}
