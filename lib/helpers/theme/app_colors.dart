import 'package:flutter/material.dart';

class AppColors {
  final bool isDark;

  AppColors._(this.isDark);

  /// Access the current theme's colors using AppColors.of(context)
  static AppColors of(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AppColors._(isDark);
  }

  // Base colors (used for theming)
  static const Color primary = Color(0xFF60C9F8);
  static const Color secondary = Color(0xFF0A599C);

  // Adaptive colors for background/surface
  Color get appBarBackground =>
      isDark ? const Color(0xFF0A599C) : const Color(0xFF60C9F8);
  Color get background =>
      isDark ? const Color(0xFF0D1B2A) : const Color(0xFFF5FBFF);
  Color get surface =>
      isDark ? const Color(0xFF1B2838) : const Color(0xFFFFFFFF);
  Color get onBackground =>
      isDark ? const Color(0xFFE3F2FD) : const Color(0xFF1A1C1E);
  Color get onSurface =>
      isDark ? const Color(0xFFE3F2FD) : const Color(0xFF1A1C1E);

  // Text colors with good contrast on surface
  Color get textPrimary =>
      isDark ? const Color(0xFFE3F2FD) : const Color(0xFF1A1C1E);
  Color get textSecondary =>
      isDark ? const Color(0xFFB0BEC5) : const Color(0xFF6B7280);
  Color get textTertiary =>
      isDark ? const Color(0xFF78909C) : const Color(0xFF9CA3AF);
  Color get textDisabled =>
      isDark ? const Color(0xFF546E7A) : const Color(0xFFD1D5DB);

  // Constants for direct use (non-adaptive)
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
}
