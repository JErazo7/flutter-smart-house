import 'package:flutter/material.dart';

import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_actions.dart';

class RoutineName extends StatefulWidget {
  final String? name;
  final String buttonAction;
  final bool showBackButton;

  final void Function(String) nameChanged;

  const RoutineName({
    Key? key,
    this.name,
    required this.nameChanged,
    required this.buttonAction,
    required this.showBackButton,
  }) : super(key: key);

  @override
  State<RoutineName> createState() => _RoutineNameState();
}

class _RoutineNameState extends State<RoutineName> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SmartHouseButton(
                text: widget.buttonAction,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    RoutineFormActions.of(context).onNext();
                  }
                },
              ),
              if (widget.showBackButton)
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter a name',
                style: theme.textTheme.headline4,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Enter a name to identify the routine',
                  style: theme.textTheme.bodyText1,
                ),
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: widget.name,
                  onChanged: widget.nameChanged,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter a name';
                    }
                    return null;
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
