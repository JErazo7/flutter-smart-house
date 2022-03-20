import 'package:flutter/material.dart';

import 'colors.dart';

final _baseTheme = ThemeData(
  primaryColor: AppColors.primary,
);

ThemeData lightTheme(BuildContext context) {
  final theme = Theme.of(context);
  final headLine4 = theme.textTheme.headline4?.copyWith(
    fontWeight: FontWeight.w600,
    color: AppColors.title,
  );
  return _baseTheme.copyWith(
    highlightColor: AppColors.highlight,
    brightness: Brightness.light,
    appBarTheme: _baseTheme.appBarTheme.copyWith(
      backgroundColor: _baseTheme.scaffoldBackgroundColor,
      centerTitle: false,
      elevation: 0,
      titleSpacing: 16,
      iconTheme: theme.iconTheme.copyWith(color: AppColors.title),
      titleTextStyle: headLine4,
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
    inputDecorationTheme: theme.inputDecorationTheme
        .copyWith(errorStyle: const TextStyle(fontSize: 14)),
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
      headline4: headLine4,
      headline5: theme.textTheme.headline5?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      headline6: theme.textTheme.headline6?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      subtitle1: theme.textTheme.subtitle1?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: theme.textTheme.bodyText2?.copyWith(fontSize: 16),
    ),
  );
}
