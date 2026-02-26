import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';

// Project - Widgets
import 'widgets/sections/typography_section.dart';
import 'widgets/sections/inputs_section.dart';
import 'widgets/sections/buttons_section.dart';
import 'widgets/sections/date_pickers_section.dart';
import 'widgets/sections/form_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          // Typography Section
          TypographySection(),
          SizedBox(height: AppDesign.xxl),

          // Simple Inputs Section (for search, etc.)
          InputsSection(),
          SizedBox(height: AppDesign.xxl),

          // Buttons Section
          ButtonsSection(),
          SizedBox(height: AppDesign.xxl),

          // Date Pickers Section
          DatePickersSection(),
          SizedBox(height: AppDesign.xxl),

          // Form Section (with validation)
          FormSection(),

          SizedBox(height: AppDesign.bottomMenuSpacing),
        ],
      ),
    );
  }
}
