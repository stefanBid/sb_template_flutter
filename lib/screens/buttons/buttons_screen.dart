import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';

// Project - Widgets
import 'buttons_section.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.only(
        left: AppDesign.xl,
        right: AppDesign.xl,
        top: AppDesign.xl,
        bottom: AppDesign.bottomMenuSpacing,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ButtonsSection(),
          SizedBox(height: AppDesign.bottomMenuSpacing),
        ],
      ),
    );
  }
}
