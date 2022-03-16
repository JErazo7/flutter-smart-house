import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/routine/routine.dart';

class RoutineFormPage extends StatelessWidget {
  // final Routine? routine;

  const RoutineFormPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();
    print(canPop);
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
