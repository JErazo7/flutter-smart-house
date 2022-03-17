import 'package:go_router/go_router.dart';

import '../pages/home/home_page.dart';
import '../pages/routine/routine_form/routine_form_page.dart';
import 'route_name.dart';

final router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: RouteName.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/routine_form',
      name: RouteName.routineForm,
      builder: (context, state) =>
          RoutineFormPage(arguments: state.extra as RoutineFormArguments?),
    ),
  ],
);
