import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../application/routine/routine_form/routine_form_controller.dart';
import '../../../../core/widgets/smart_house_button.dart';

class RoutineName extends ConsumerStatefulWidget {
  final VoidCallback validated;

  const RoutineName({
    Key? key,
    required this.validated,
  }) : super(key: key);

  @override
  _RoutineNameState createState() => _RoutineNameState();
}

class _RoutineNameState extends ConsumerState<RoutineName> {
  final _formKey = GlobalKey<FormState>();
  late bool _isEditing;
  late final TextEditingController _textController;
  final _provider = routineFormControllerProvider;

  @override
  void initState() {
    final state = ref.read(_provider);
    _textController = TextEditingController(text: state.routine.name);
    _isEditing = state.isEditing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SmartHouseButton(
            text: _isEditing ? 'Save' : 'Next',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                widget.validated();
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
                  controller: _textController,
                  autofocus: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    ref.read(_provider.notifier).nameUpdated(value);
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

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
