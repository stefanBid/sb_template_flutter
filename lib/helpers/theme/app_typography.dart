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

  // Typography styles usando i colori di AppColors
  TextStyle get heading1 => TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: colors.textPrimary,
  );

  TextStyle get heading2 => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: colors.textPrimary,
  );

  TextStyle get heading3 => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: colors.textPrimary,
  );

  TextStyle get body => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: colors.textPrimary,
  );

  TextStyle get bodySecondary => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: colors.textSecondary,
  );

  TextStyle get caption => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: colors.textSecondary,
  );

  TextStyle get small => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: colors.textTertiary,
  );
}
