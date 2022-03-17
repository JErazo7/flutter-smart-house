import 'package:flutter/material.dart';

import 'colors.dart';

final _baseTheme = ThemeData(
  primaryColor: AppColors.primary,
);

ThemeData lightTheme(BuildContext context) {
  final theme = Theme.of(context);
  return _baseTheme.copyWith(
    brightness: Brightness.light,
    appBarTheme: _baseTheme.appBarTheme.copyWith(
      backgroundColor: _baseTheme.scaffoldBackgroundColor,
      centerTitle: false,
      elevation: 0,
      titleSpacing: 16,
      iconTheme: theme.iconTheme.copyWith(color: AppColors.title),
      titleTextStyle: theme.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.title,
      ),
    ),
    textTheme: theme.textTheme.copyWith(
      headline1: theme.textTheme.headline1?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline2: theme.textTheme.headline2?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline3: theme.textTheme.headline3?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline4: theme.textTheme.headline4?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline5: theme.textTheme.headline5?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline6: theme.textTheme.headline6?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      subtitle1: theme.textTheme.subtitle1?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}
