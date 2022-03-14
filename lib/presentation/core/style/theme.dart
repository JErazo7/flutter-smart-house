import 'package:flutter/material.dart';

import 'colors.dart';

final _baseTheme = ThemeData(
  primaryColor: AppColors.primary,
);

const _textTheme = TextTheme(
  headline1: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  headline2: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  headline3: TextStyle(
    fontWeight: FontWeight.w400,
  ),
  headline4: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  headline5: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  headline6: TextStyle(
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    fontWeight: FontWeight.w600,
  ),
);

ThemeData lightTheme(BuildContext context) {
  final theme = Theme.of(context);
  return _baseTheme.copyWith(
    brightness: Brightness.light,
    appBarTheme: _baseTheme.appBarTheme.copyWith(
      backgroundColor: _baseTheme.scaffoldBackgroundColor,
      centerTitle: false,
      titleTextStyle:
          theme.textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),
    ),
    textTheme: theme.textTheme.merge(_textTheme),
    colorScheme: const ColorScheme.light(
      secondary: AppColors.secondary,
    ),
  );
}
