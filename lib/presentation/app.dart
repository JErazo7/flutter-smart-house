import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/style/theme.dart';
import 'routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: () => MaterialApp.router(
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return widget!;
        },
        title: 'Smart House',
        theme: lightTheme(context),
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
      ),
    );
  }
}
