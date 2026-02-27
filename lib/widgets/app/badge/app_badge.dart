import 'package:flutter/material.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_design.dart';
import '../../../helpers/theme/app_typography.dart';

enum BadgeVariant { primary, secondary, success, warning, error }

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.text,
    this.variant = BadgeVariant.primary,
    this.icon,
  });

  final String text;
  final BadgeVariant variant;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    final badgeColor = _getColor(colors);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDesign.md,
        vertical: AppDesign.xs,
      ),
      decoration: BoxDecoration(
        color: badgeColor.withAlpha(26),
        borderRadius: AppDesign.borderRadiusM,
        border: Border.all(color: badgeColor.withAlpha(77), width: 1.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppDesign.iconS, color: badgeColor),
            const SizedBox(width: AppDesign.xs),
          ],
          Text(
            text,
            style: AppTypography.of(
              context,
            ).small.copyWith(color: badgeColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Color _getColor(AppColors colors) {
    switch (variant) {
      case BadgeVariant.primary:
        return AppColors.primary;
      case BadgeVariant.secondary:
        return AppColors.secondary;
      case BadgeVariant.success:
        return AppColors.success;
      case BadgeVariant.warning:
        return AppColors.warning;
      case BadgeVariant.error:
        return AppColors.error;
    }
  }
}
