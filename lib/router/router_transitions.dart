// Flutter
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Internal Dependencies
import '../models/app_route.dart';

class RouterTransitions {
  static CustomTransitionPage build({
    required Widget child,
    required GoRouterState state,
    required BuildContext context,
    PageTransitionType transitionType = PageTransitionType.fade,
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        switch (transitionType) {
          case PageTransitionType.slideFromRight:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            );
          case PageTransitionType.slideFromLeft:
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            );
          default:
            return FadeTransition(opacity: curvedAnimation, child: child);
        }
      },
    );
  }

  static NoTransitionPage buildWithoutTransition({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return NoTransitionPage(key: state.pageKey, child: child);
  }
}
