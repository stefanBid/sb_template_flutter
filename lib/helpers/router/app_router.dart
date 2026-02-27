import 'package:flutter/material.dart';
// Project - Models
import '../../models/app_route.dart';

class AppRouter {
  AppRouter._();

  static List<AppRoute> get routes => [
    const AppRoute(
      label: 'Typography',
      path: AppRoutePath.typography,
      screenTitle: 'Typography',
      icon: Icons.text_fields,
    ),
    const AppRoute(
      label: 'Inputs',
      path: AppRoutePath.inputs,
      screenTitle: 'Inputs & Date Pickers',
      icon: Icons.edit_outlined,
    ),
    const AppRoute(
      label: 'Buttons',
      path: AppRoutePath.buttons,
      screenTitle: 'Buttons',
      icon: Icons.touch_app,
    ),
    const AppRoute(
      label: 'Forms',
      path: AppRoutePath.forms,
      screenTitle: 'Forms',
      icon: Icons.assignment,
    ),
    const AppRoute(
      label: 'Components',
      path: AppRoutePath.components,
      screenTitle: 'UI Components',
      icon: Icons.widgets_outlined,
    ),
  ];

  static String get initialRoute => AppRoutePath.splash.value;
  static String get splashRoute => AppRoutePath.splash.value;
  static String get typographyRoute => AppRoutePath.typography.value;
  static String get inputsRoute => AppRoutePath.inputs.value;
  static String get buttonsRoute => AppRoutePath.buttons.value;
  static String get formsRoute => AppRoutePath.forms.value;
  static String get componentsRoute => AppRoutePath.components.value;
}
