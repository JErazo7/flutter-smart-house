import 'package:go_router/go_router.dart';

import '../../domain/routine/routine.dart';
import '../pages/home/home_page.dart';
import '../pages/routine/routine_form/routine_form_page.dart';
import 'route_name.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      // name: RouteName.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/routine',
      // name: RouteName.routineForm,
      builder: (context, state) => RoutineFormPage(),
    ),
  ],
);
