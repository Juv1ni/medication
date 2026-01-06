import 'package:flutter/material.dart';
import 'package:medication/core/theme/app_colors.dart';

class AppTextStyles {
  static const title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const body = TextStyle(fontSize: 14, color: AppColors.textPrimary);

  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
