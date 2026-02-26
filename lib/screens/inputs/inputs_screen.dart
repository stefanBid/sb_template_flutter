import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';

// Project - Widgets
import 'sections/inputs_section.dart';
import 'sections/date_pickers_section.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({super.key});

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
          InputsSection(),
          SizedBox(height: AppDesign.xxl),
          DatePickersSection(),
          SizedBox(height: AppDesign.bottomMenuSpacing),
        ],
      ),
    );
  }
}
