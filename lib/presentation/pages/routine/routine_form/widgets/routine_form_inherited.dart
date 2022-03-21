import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../application/routine/routine_form/routine_form_controller.dart';

class RoutineFormInherited extends InheritedWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final AutoDisposeStateNotifierProvider<RoutineFormController,
      RoutineFormState> provider;

  const RoutineFormInherited({
    required this.provider,
    required this.onNext,
    required this.onPrevious,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  static RoutineFormInherited of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<RoutineFormInherited>();
    assert(result != null, 'No RoutineFormMethods found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
