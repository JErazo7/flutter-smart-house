import 'package:flutter/material.dart';

class RoutineFormActions extends InheritedWidget {
  const RoutineFormActions({
    required this.onNext,
    required this.onPrevious,
    required Widget child,
    Key? key,
  }) : super(child: child, key: key);

  final VoidCallback onNext;
  final VoidCallback onPrevious;

  static RoutineFormActions of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<RoutineFormActions>();
    assert(result != null, 'No RoutineFormMethods found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
