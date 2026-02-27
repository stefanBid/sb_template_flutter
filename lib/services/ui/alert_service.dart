import 'package:flutter/material.dart';

// Project - Helpers
import '../../helpers/theme/app_typography.dart';
import '../../helpers/theme/app_colors.dart';
import '../../helpers/theme/app_design.dart';

// Project - Widgets
import '../../widgets/app/button/app_button.dart';

enum AlertType { success, error, info }

class AlertService {
  const AlertService._();

  static void showAppSnackBar(
    BuildContext context,
    String message, {
    IconData? icon,
    AlertType type = AlertType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      backgroundColor: _getBackgroundColor(context, type),
      content: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              message,
              style: AppTypography.of(
                context,
              ).body.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      duration: duration,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> showAppDialog({
    required BuildContext context,
    required String title,
    required String message,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    AlertType type = AlertType.info,
    bool barrierDismissible = true,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.of(context).background,
          shape: RoundedRectangleBorder(borderRadius: AppDesign.borderRadiusL),
          title: Row(
            children: [
              Icon(
                _getIconForType(type),
                color: _getBackgroundColor(context, type),
                size: 24,
              ),
              const SizedBox(width: AppDesign.sm),
              Expanded(
                child: Text(title, style: AppTypography.of(context).heading3),
              ),
            ],
          ),
          content: Text(message, style: AppTypography.of(context).body),
          contentPadding: const EdgeInsets.fromLTRB(
            AppDesign.xl,
            AppDesign.lg,
            AppDesign.xl,
            AppDesign.md,
          ),
          titlePadding: const EdgeInsets.fromLTRB(
            AppDesign.xl,
            AppDesign.xl,
            AppDesign.xl,
            AppDesign.sm,
          ),
          actionsPadding: const EdgeInsets.fromLTRB(
            AppDesign.xl,
            AppDesign.sm,
            AppDesign.xl,
            AppDesign.lg,
          ),
          actions: [
            if (cancelText != null)
              AppButton(
                text: cancelText,
                variant: AppButtonVariant.outline,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onCancel?.call();
                },
              ),
            if (confirmText != null)
              AppButton(
                text: confirmText,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  onConfirm?.call();
                },
              ),
          ],
        );
      },
    );
  }

  static Color _getBackgroundColor(BuildContext context, AlertType type) {
    switch (type) {
      case AlertType.success:
        return AppColors.success;
      case AlertType.error:
        return AppColors.error;
      default:
        return AppColors.secondary;
    }
  }

  static IconData _getIconForType(AlertType type) {
    switch (type) {
      case AlertType.success:
        return Icons.check_circle_outline;
      case AlertType.error:
        return Icons.error_outline;
      default:
        return Icons.info_outline;
    }
  }
}
