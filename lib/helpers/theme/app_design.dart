import 'package:flutter/material.dart';

class AppDesign {
  AppDesign._();

  // ========================================
  // SPACING SCALE
  // ========================================
  // (xs) 4: Minimal gap between inline elements (e.g., icon-text)
  // (sm) 8: Spacing between small related elements
  // (md) 12: Standard spacing between cards/grouped elements
  // (lg) 16: Internal padding for components, spacing for related sections
  // (xl) 24: Spacing between main groups/sections
  // (xxl) 32: Macro-separations between main sections

  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double lgSm = 20.0;
  static const double xl = 24.0;
  static const double xxl = 32.0;

  // ========================================
  // BORDER RADIUS
  // ========================================
  static BorderRadius get borderRadiusXS => BorderRadius.circular(2);
  static BorderRadius get borderRadiusS => BorderRadius.circular(4);
  static BorderRadius get borderRadiusM => BorderRadius.circular(6);
  static BorderRadius get borderRadiusL => BorderRadius.circular(10);
  static BorderRadius get borderRadiusXL => BorderRadius.circular(16);
  static BorderRadius get borderRadiusFULL => BorderRadius.circular(9999);

  // ========================================
  // PADDING - ALL SIDES
  // ========================================
  static const EdgeInsets paddingXS = EdgeInsets.all(xs);
  static const EdgeInsets paddingS = EdgeInsets.all(sm);
  static const EdgeInsets paddingM = EdgeInsets.all(md);
  static const EdgeInsets paddingL = EdgeInsets.all(lg);
  static const EdgeInsets paddingXL = EdgeInsets.all(xl);
  static const EdgeInsets paddingXXL = EdgeInsets.all(xxl);

  // ========================================
  // BOTTOM MENU SPACING
  // ========================================
  // Spacing to consider at the bottom of scrollable views
  // to avoid content being hidden behind bottom navigation bars
  static const double bottomMenuSpacing = 110.0;

  // ========================================
  // ELEVATION LEVELS
  // ========================================

  static const double cardElevation = 2.0;
  static const double appBarElevation = 4.0;
  static const double bottomAppBarElevation = 4.0;
  static const double dialogElevation = 6.0;
  static const double snackbarElevation = 8.0;

  // ========================================
  // ICON SIZES
  // ========================================

  static const double iconXS = 12.0;
  static const double iconS = 16.0;
  static const double iconM = 20.0;
  static const double iconL = 24.0;
  static const double iconXL = 32.0;
  static const double iconXXL = 36.0;
  static const double iconXXXL = 48.0;

  // ========================================
  // SHADOWS
  // ========================================

  /// Light shadow for subtle elevation (cards, buttons)
  static List<BoxShadow> get shadowLight => [
    BoxShadow(
      color: Colors.black.withAlpha(13),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// Medium shadow for moderate elevation (dialogs, dropdowns)
  static List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: Colors.black.withAlpha(26),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  /// Strong shadow for high elevation (modals, floating elements)
  static List<BoxShadow> get shadowStrong => [
    BoxShadow(
      color: Colors.black.withAlpha(38),
      blurRadius: 16,
      offset: const Offset(0, 6),
    ),
  ];

  /// Extra strong shadow for maximum elevation (tooltips, popovers)
  static List<BoxShadow> get shadowXStrong => [
    BoxShadow(
      color: Colors.black.withAlpha(51),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
  ];

  // ========================================
  // MAX WIDTHS
  // ========================================
  static const double maxWidthMobile = 428;
  static const double maxWidthTablet = 768;
  static const double maxWidthDesktop = 1200;

  // ========================================
  // ANIMATION DURATIONS
  // ========================================
  static const Duration animationShort = Duration(milliseconds: 150);
  static const Duration animationMedium = Duration(milliseconds: 300);
  static const Duration animationLong = Duration(milliseconds: 500);
}
