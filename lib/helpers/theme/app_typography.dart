import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTypography {
  final AppColors colors;

  AppTypography._(this.colors);

  /// Access the current theme's typography using AppTypography.of(context)
  static AppTypography of(BuildContext context) {
    final colors = AppColors.of(context);
    return AppTypography._(colors);
  }

  // Typography styles optimized for mobile devices following Material Design guidelines
  // Scale: 28 > 22 > 18 > 16 > 14 > 12 > 11

  /// Main screen titles (28px, bold)
  TextStyle get heading1 => TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: colors.textPrimary,
  );

  /// Section titles (22px, bold)
  TextStyle get heading2 => TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: colors.textPrimary,
  );

  /// Subsection titles (18px, semibold)
  TextStyle get heading3 => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: colors.textPrimary,
  );

  /// Card titles, list item titles (16px, semibold)
  TextStyle get heading4 => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: colors.textPrimary,
  );

  /// Regular body text (16px, normal)
  TextStyle get body => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  /// Compact body text for inputs and dense UI (14px, normal)
  TextStyle get bodyMedium => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  /// Secondary body text (16px, normal)
  TextStyle get bodySecondary => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: colors.textSecondary,
  );

  /// Secondary information, labels (12px, normal)
  TextStyle get caption => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: colors.textSecondary,
  );

  /// Badges, tiny labels (11px, normal)
  TextStyle get small => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: colors.textTertiary,
  );
}
