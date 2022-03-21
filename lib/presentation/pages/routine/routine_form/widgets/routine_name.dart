import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/widgets/smart_house_button.dart';
import 'routine_form_inherited.dart';

class RoutineName extends ConsumerStatefulWidget {
  const RoutineName({Key? key}) : super(key: key);

  @override
  _RoutineNameState createState() => _RoutineNameState();
}

class _RoutineNameState extends ConsumerState<RoutineName> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final provider = RoutineFormInherited.of(context).provider;
      final name = ref.read(provider).routine.name;
      _controller.text = name;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final provider = RoutineFormInherited.of(context).provider;

    return Scaffold(
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
                  controller: _controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: ref.read(provider.notifier).nameUpdated,
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final isEditing =
                      ref.watch(provider.select((value) => value.isEditing));
                  return SmartHouseButton(
                    text: isEditing ? 'Save' : 'Next',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        RoutineFormInherited.of(context).onNext();
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
