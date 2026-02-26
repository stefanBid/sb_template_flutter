import 'package:flutter/material.dart';

// Project - Helpers
import '../../../helpers/theme/app_colors.dart';
import '../../../helpers/theme/app_design.dart';
import '../../../helpers/theme/app_typography.dart';

enum AppButtonVariant { solid, outline }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = AppButtonVariant.solid,
    this.isLoading = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fullWidth = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool fullWidth;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: variant == AppButtonVariant.solid
          ? _buildSolidButton(context, isDisabled)
          : _buildOutlineButton(context, isDisabled),
    );
  }

  Widget _buildSolidButton(BuildContext context, bool isDisabled) {
    return ElevatedButton(
      onPressed: isDisabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.of(context).appBarBackground,
        foregroundColor: Colors.white,
        disabledBackgroundColor: AppColors.of(context).textDisabled,
        disabledForegroundColor: AppColors.of(context).textSecondary,
        padding: AppDesign.paddingM,
        elevation: 2,
        shadowColor: AppColors.of(context).appBarBackground.withAlpha(77),
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderRadiusL),
      ),
      child: _buildButtonContent(context, Colors.white),
    );
  }

  Widget _buildOutlineButton(BuildContext context, bool isDisabled) {
    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.of(context).appBarBackground,
        disabledForegroundColor: AppColors.of(context).textDisabled,
        padding: AppDesign.paddingM,
        side: BorderSide(
          color: isDisabled
              ? AppColors.of(context).textDisabled
              : AppColors.of(context).appBarBackground,
          width: 1.5,
        ),
        shape: RoundedRectangleBorder(borderRadius: AppDesign.borderRadiusL),
      ),
      child: _buildButtonContent(
        context,
        isDisabled
            ? AppColors.of(context).textDisabled
            : AppColors.of(context).appBarBackground,
      ),
    );
  }

  Widget _buildButtonContent(BuildContext context, Color iconColor) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (prefixIcon != null && !isLoading) ...[
          Icon(prefixIcon, size: AppDesign.iconM),
          const SizedBox(width: AppDesign.sm),
        ],
        Flexible(
          child: Text(
            text,
            style: AppTypography.of(
              context,
            ).body.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ),
        if (isLoading) ...[
          const SizedBox(width: AppDesign.sm),
          SizedBox(
            width: AppDesign.iconM,
            height: AppDesign.iconM,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(iconColor),
            ),
          ),
        ] else if (suffixIcon != null) ...[
          const SizedBox(width: AppDesign.sm),
          Icon(suffixIcon, size: AppDesign.iconM),
        ],
      ],
    );
  }
}
