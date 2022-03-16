import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      titleSpacing: 16.r,
      titleTextStyle: theme.textTheme.headline5
          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 24.sp),
    ),
    textTheme: theme.textTheme.copyWith(
      headline1: theme.textTheme.headline1?.copyWith(
        fontSize: 96.sp,
        fontWeight: FontWeight.w600,
      ),
      headline2: theme.textTheme.headline2?.copyWith(
        fontSize: 60.sp,
        fontWeight: FontWeight.w600,
      ),
      headline3: theme.textTheme.headline3?.copyWith(
        fontSize: 48.sp,
        fontWeight: FontWeight.w600,
      ),
      headline4: theme.textTheme.headline4?.copyWith(
        fontSize: 34.sp,
        fontWeight: FontWeight.w600,
      ),
      headline5: theme.textTheme.headline5?.copyWith(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      headline6: theme.textTheme.headline6?.copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle1: theme.textTheme.subtitle1?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
      subtitle2: theme.textTheme.subtitle2?.copyWith(fontSize: 14.sp),
      bodyText1: theme.textTheme.bodyText1?.copyWith(fontSize: 16.sp),
      bodyText2: theme.textTheme.bodyText2?.copyWith(fontSize: 14.sp),
      button: theme.textTheme.button?.copyWith(fontSize: 14.sp),
      caption: theme.textTheme.caption?.copyWith(fontSize: 12.sp),
      overline: theme.textTheme.overline?.copyWith(fontSize: 10.sp),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
}
