import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_design.dart';

// Project - Widgets
import 'form_section.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen({super.key});

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
          FormSection(),
          SizedBox(height: AppDesign.bottomMenuSpacing),
        ],
      ),
    );
  }
}
