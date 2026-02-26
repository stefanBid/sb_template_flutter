import 'package:flutter/material.dart';

enum AppRoutePath {
  splash('/'),
  home('/home'),
  typography('/typography'),
  inputs('/inputs'),
  buttons('/buttons'),
  forms('/forms');

  const AppRoutePath(this.value);
  final String value;
}

enum PageTransitionType { slideFromRight, slideFromLeft, fade }

class AppRoute {
  const AppRoute({
    required this.path,
    required this.label,
    this.screenTitle,
    this.icon,
  });

  final String? screenTitle;
  final AppRoutePath path;
  final String label;
  final IconData? icon;
}
