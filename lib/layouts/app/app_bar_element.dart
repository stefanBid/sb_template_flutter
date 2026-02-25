import 'package:flutter/material.dart';

// Project - Helpers
import 'package:sb_template_flutter/helpers/theme/app_colors.dart';
import 'package:sb_template_flutter/helpers/theme/app_typography.dart';
import 'package:sb_template_flutter/helpers/theme/app_design.dart';

class AppBarElement extends StatelessWidget implements PreferredSizeWidget {
  const AppBarElement({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      title: Text(title, style: AppTypography.of(context).heading3),
      backgroundColor: AppColors.of(context).appBarBackground,
      elevation: AppDesign.appBarElevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
