import 'package:flutter/material.dart';
import 'package:sb_template_flutter/router/router_extensions.dart';

// Project - Helpers
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_design.dart';
import '../../helpers/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  // Delay personalizzabile per lo splash screen
  static const Duration splashDuration = Duration(seconds: 2);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    // Delay personalizzabile per mostrare lo splash
    await Future.delayed(SplashScreen.splashDuration);

    // Naviga alla home dopo l'inizializzazione
    if (mounted) {
      context.goTo(AppRouter.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context).background,
      body: Center(
        child: Container(
          width: 300,
          padding: AppDesign.paddingXXL,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppDesign.borderRadiusXL,
            boxShadow: AppDesign.shadowMedium,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/sb-template-flutter-logo.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: AppDesign.xl),
              SizedBox(
                width: 40,
                height: 40,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.of(context).appBarBackground,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
