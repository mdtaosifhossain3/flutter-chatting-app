import 'package:flutter/material.dart';
import 'package:sampark/config/app_colors.dart';

var lightTheme = ThemeData();
var darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: const ColorScheme.dark(
        primary: AppColors.dPrimaryColor,
        surface: AppColors.dScaffoldColor,
        onSurface: AppColors.dContainerColor,
        onPrimary: AppColors.dOnTextColor,
        primaryContainer: AppColors.dContainerColor,
        onPrimaryContainer: AppColors.dOnTextColor),
    textTheme: const TextTheme(
        headlineLarge: TextStyle(
            fontSize: 32,
            color: AppColors.dPrimaryColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w800),
        headlineMedium: TextStyle(
            fontSize: 30,
            color: AppColors.dOnTextColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700),
        headlineSmall: TextStyle(
            fontSize: 20,
            color: AppColors.dOnTextColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600)));
