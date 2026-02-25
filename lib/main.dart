import 'package:flutter/material.dart';

// Project - Helpers
import 'helpers/theme/app_theme.dart';

// Project - Router
import 'router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'SB-Template-Flutter',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: createRouter(),
    );
  }
}
