import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Project - Screens
import '../screens/splash/splash_screen.dart';
import '../screens/typography/typography_screen.dart';
import '../screens/inputs/inputs_screen.dart';
import '../screens/buttons/buttons_screen.dart';
import '../screens/forms/forms_screen.dart';
import '../screens/components/components_screen.dart';

// Project - Layouts
import '../layouts/app/app_layout.dart';

// Project - Helpers
import '../helpers/router/app_router.dart';

// Other
import 'router_transitions.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _sub = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  late final StreamSubscription<dynamic> _sub;
  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

GoRouter createRouter() {
  return GoRouter(
    initialLocation: AppRouter.initialRoute,
    routes: [
      GoRoute(
        path: AppRouter.splashRoute,
        builder: (context, state) => const SplashScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppLayout(
            navigationShell: navigationShell,
            tabs: AppRouter.routes,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.typographyRoute,
                pageBuilder: (context, state) => RouterTransitions.build(
                  context: context,
                  state: state,
                  child: const TypographyScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.inputsRoute,
                pageBuilder: (context, state) => RouterTransitions.build(
                  context: context,
                  state: state,
                  child: const InputsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.buttonsRoute,
                pageBuilder: (context, state) => RouterTransitions.build(
                  context: context,
                  state: state,
                  child: const ButtonsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.formsRoute,
                pageBuilder: (context, state) => RouterTransitions.build(
                  context: context,
                  state: state,
                  child: const FormsScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRouter.componentsRoute,
                pageBuilder: (context, state) => RouterTransitions.build(
                  context: context,
                  state: state,
                  child: const ComponentsScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
