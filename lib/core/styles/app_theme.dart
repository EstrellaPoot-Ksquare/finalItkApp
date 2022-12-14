import 'package:final_itk_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.scaffoldBg,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.appBarBg,
      foregroundColor: AppColors.main,
      elevation: 0,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.main,
        foregroundColor: AppColors.scaffoldBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.main,
      ),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: AppColors.snackbarBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      behavior: SnackBarBehavior.floating,
      contentTextStyle: TextStyle(
        color: AppColors.snackbarMsg,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
