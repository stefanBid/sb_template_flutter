import 'package:flutter/material.dart';
// Project - Models
import '../../models/app_route.dart';

class AppRouter {
  AppRouter._();

  static List<AppRoute> get routes => [
    const AppRoute(
      label: 'Home',
      path: AppRoutePath.home,
      screenTitle: 'Welcome to SB Template Flutter',
      icon: Icons.home,
    ),
  ];

  static String get initialRoute => AppRoutePath.splash.value;
  static String get homeRoute => AppRoutePath.home.value;
  static String get splashRoute => AppRoutePath.splash.value;
}
