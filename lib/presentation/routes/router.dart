import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
  ],
);
