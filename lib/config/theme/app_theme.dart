import 'package:flutter/material.dart';
import 'package:fsm_app/config/theme/colors/app_colors.dart';

class AppTheme {
  static const TextStyle textStyleLight =
      TextStyle(fontSize: 16, color: Colors.black);
  static const TextStyle textStyleDark =
      TextStyle(fontSize: 16, color: Colors.white);

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.lightBackground,
      brightness: Brightness.light,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.darkGrey),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.darkGrey),
          ),
          hintStyle: const TextStyle(color: AppColors.darkGrey, fontSize: 10)));

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBackground,
      brightness: Brightness.dark,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 20, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
        bodySmall: TextStyle(fontSize: 12, color: AppColors.grey),
      ),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.grey),
          ),
          hintStyle: const TextStyle(color: AppColors.grey, fontSize: 10)));
}
