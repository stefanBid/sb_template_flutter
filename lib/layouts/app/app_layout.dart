import 'package:flutter/material.dart';

// Project - Helpers
import 'package:sb_template_flutter/helpers/theme/app_colors.dart';
import 'package:sb_template_flutter/helpers/theme/app_typography.dart';
import 'package:sb_template_flutter/helpers/theme/app_design.dart';

// Project - Widgets
import 'app_bar_element.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
    required this.body,
    this.title = 'SB Template Flutter',
  });
  final Widget body;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.of(context).background,
      appBar: AppBarElement(title: title),
      body: body,
    );
  }
}
