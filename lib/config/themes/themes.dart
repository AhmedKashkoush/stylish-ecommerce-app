import 'package:flutter/material.dart';
import 'package:stylish_ecommerce_app/core/constants/colors.dart';
import 'package:stylish_ecommerce_app/core/constants/fonts.dart';

class AppThemes {
  static final ThemeData light = ThemeData(
    fontFamily: AppFonts.montserrat,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundLight,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      secondary: AppColors.secondary,
    ),
  );
  static final ThemeData dark = ThemeData(
    fontFamily: AppFonts.montserrat,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundDark,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      secondary: AppColors.secondary,
      brightness: Brightness.dark,
    ),
  );
}
