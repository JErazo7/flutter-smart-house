import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routine_form_inherited.dart';

class RoutineFormAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String position;
  const RoutineFormAppbar({Key? key, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = RoutineFormInherited.of(context).provider;
    return AppBar(
      leadingWidth: 80,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        splashRadius: 0.1,
        icon: const Icon(Icons.close),
      ),
      actions: [
        Consumer(
          builder: (context, ref, child) {
            final isEditing =
                ref.watch(provider.select((value) => value.isEditing));
            if (!isEditing) return child!;
            return const SizedBox();
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                position,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
