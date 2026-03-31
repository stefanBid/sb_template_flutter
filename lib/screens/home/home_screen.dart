import 'package:flutter/material.dart';

// Project Helpers
import '../../helpers/app_colors.dart';
import '../../helpers/app_design.dart';
import '../../helpers/app_router.dart';
import '../../helpers/app_typography.dart';

// Project Layouts
import '../../layouts/app_bars/classic_app_bar.dart';
import '../../layouts/standard_page_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StandardPageLayout(
      appBar: const ClassicAppBar(title: 'Home'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Home Screen!',
            style: AppTypography.of(context).heading4,
          ),
        ],
      ),
    );
  }
}
