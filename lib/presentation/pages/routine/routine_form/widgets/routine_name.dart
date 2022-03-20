import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../core/widgets/flat_smart_house_button.dart';
import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_actions.dart';

class RoutineName extends StatefulWidget {
  final String buttonAction;
  final bool showBackButton;

  const RoutineName({
    Key? key,
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
    final provider = routineFormControllerProvider;

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
                child: Consumer(
                  builder: (context, ref, _) {
                    final name = ref.watch(
                      provider.select((value) => value.routine.name),
                    );
                    return TextFormField(
                      autofocus: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      initialValue: name,
                      onChanged: ref.read(provider.notifier).nameUpdated,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter a name';
                        }
                        return null;
                      },
                    );
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
