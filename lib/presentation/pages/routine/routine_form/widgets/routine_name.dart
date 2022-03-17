import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/smart_house_button.dart';

class RoutineName extends ConsumerWidget {
  final String? name;
  final bool isEditing;
  final void Function(String) onChanged;
  final VoidCallback validated;

  RoutineName({
    Key? key,
    required this.validated,
    required this.name,
    required this.onChanged,
    this.isEditing = false,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SmartHouseButton(
            text: isEditing ? 'Save' : 'Next',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                validated();
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
                  initialValue: name,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    onChanged(value);
                  },
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
