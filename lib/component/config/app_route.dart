import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../screens/home/home_screen.dart';

class AppRoute {
  // path
  static const String pathDefaultRoute = '/';

  // name
  static const String defaultNameRoute = 'defaultNameRoute';

  // The route configuration.
  static GoRouter router = GoRouter(
    // errorBuilder: (context, state) {
    //   return;
    // },
    initialLocation: pathDefaultRoute,
    // debugLogDiagnostics: true,
    navigatorKey: AppNav.navigatorKey,
    routerNeglect: true,
    routes: <RouteBase>[
      GoRoute(
        path: pathDefaultRoute,
        name: defaultNameRoute,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
