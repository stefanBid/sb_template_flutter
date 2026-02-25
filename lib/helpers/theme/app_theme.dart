import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppColors.primary,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );

  static ThemeData get darkTheme => ThemeData(
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: AppColors.primary,
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
}
