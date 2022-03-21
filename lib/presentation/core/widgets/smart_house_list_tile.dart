import 'package:flutter/material.dart';

import '../utils/utils.dart';

class SmartHouseListTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final int iconId;
  final VoidCallback onTap;

  const SmartHouseListTile({
    Key? key,
    required this.iconId,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconData = getIconDataFromId(iconId);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        child: PhysicalModel(
          color:
              isSelected ? theme.highlightColor : theme.colorScheme.secondary,
          elevation: isSelected ? 4 : 2,
          shadowColor:
              isSelected ? theme.primaryColor : theme.colorScheme.secondary,
          borderRadius: BorderRadius.circular(16),
          child: ListTile(
            selected: isSelected,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            title: Text(
              title,
              style: theme.textTheme.headline6
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            leading: CircleAvatar(
              backgroundColor: theme.primaryColor,
              radius: 18,
              child: Icon(
                iconData,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
