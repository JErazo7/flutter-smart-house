import 'package:flutter/material.dart';

import '../../../../domain/routine/routine.dart';

class RoutineFormPage extends StatelessWidget {
  final Routine? routine;

  const RoutineFormPage({Key? key, this.routine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
