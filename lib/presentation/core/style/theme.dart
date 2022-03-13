import 'package:flutter/material.dart';

import 'colors.dart';

final _baseTheme = ThemeData(
  primaryColor: AppColors.primary,
);

final lightTheme = _baseTheme.copyWith(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(secondary: AppColors.secondary),
);

final darkTheme = _baseTheme.copyWith(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(secondary: AppColors.secondary),
);
