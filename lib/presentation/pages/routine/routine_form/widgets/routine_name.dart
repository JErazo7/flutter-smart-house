import 'package:flutter/material.dart';

import '../../../../core/widgets/smart_house_button.dart';

class RoutineName extends StatefulWidget {
  final String? name;
  final bool isEditing;
  final void Function(String) nameChanged;
  final VoidCallback onNext;
  final VoidCallback onSave;

  const RoutineName({
    Key? key,
    this.name,
    required this.nameChanged,
    required this.isEditing,
    required this.onNext,
    required this.onSave,
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
          child: SmartHouseButton(
            text: widget.isEditing ? 'Save' : 'Next',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                FocusManager.instance.primaryFocus?.unfocus();
                if (widget.isEditing) {
                  return widget.onSave();
                }
                widget.onNext();
              }
            },
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
