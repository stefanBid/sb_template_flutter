// Flutter
import 'package:flutter/material.dart';
// Packages
import 'package:go_router/go_router.dart';

/// Global navigation extensions for BuildContext
/// For custom navigation methods usable everywhere in the app.
extension NavigationExtension on BuildContext {
  /// Navigate to a route (replaces current route)
  void goTo(String route) {
    go(route);
  }

  /// Push a route (adds to stack)
  void pushTo(String route) {
    push(route);
  }

  /// Go back (returns true if can pop)
  bool goBack() {
    if (canPop()) {
      pop();
      return true;
    }
    return false;
  }

  /// Get current route path
  String get currentRoute {
    try {
      return GoRouterState.of(this).uri.path;
    } catch (_) {
      return '/';
    }
  }

  /// Check if a specific route is current
  bool isCurrentRoute(String route) {
    return currentRoute == route;
  }
}
