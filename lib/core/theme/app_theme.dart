import 'package:flutter/material.dart';
import 'package:medication/core/theme/app_colors.dart';
import 'package:medication/core/theme/app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.surface,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.onTertiary,
      error: AppColors.error,
      surface: AppColors.surface,
      inversePrimary: AppColors.inversePrimary,
    ),

    textTheme: const TextTheme(
      titleLarge: AppTextStyles.title,
      titleMedium: AppTextStyles.subtitle,
      bodyMedium: AppTextStyles.body,
      labelLarge: AppTextStyles.button,
      labelMedium: AppTextStyles.mediumButton,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.title.copyWith(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 1,
      ),
    ),
  );
}
