import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetbook_challenge/core/colors.dart';

/// main app custom [Theme]
class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.kDarkModeFillColor,
    ),
    headline1: GoogleFonts.quicksand(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.kDarkModeFillColor,
    ),
    headline2: GoogleFonts.quicksand(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: AppColors.kDarkModeFillColor,
    ),
    headline3: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.kDarkModeFillColor,
    ),
    headline6: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.kDarkModeFillColor,
    ),
    button: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.kMainColor,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: AppColors.kWhiteColor,
    ),
    headline1: GoogleFonts.quicksand(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.kWhiteColor,
    ),
    headline2: GoogleFonts.quicksand(
      fontSize: 21,
      fontWeight: FontWeight.w700,
      color: AppColors.kWhiteColor,
    ),
    headline3: GoogleFonts.quicksand(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.kWhiteColor,
    ),
    headline6: GoogleFonts.quicksand(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.kWhiteColor,
    ),
    button: GoogleFonts.quicksand(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.kMainColor,
    ),
  );

  /// global app [ThemeData] in light mode
  static ThemeData light() => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.kBackgroundColor,
        textTheme: _lightTextTheme,
        primaryIconTheme: const IconThemeData(color: AppColors.kShadeColor),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.kMainColor),
        appBarTheme: const AppBarTheme(color: AppColors.kMainColor),
      );

  /// global app [ThemeData] in dark mode
  static ThemeData dark() => ThemeData(
        brightness: Brightness.dark,
        textTheme: _darkTextTheme,
        scaffoldBackgroundColor: AppColors.kDarkModeColor,
        primaryIconTheme: const IconThemeData(color: AppColors.kShadeColor),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.kMainColor),
        appBarTheme: const AppBarTheme(color: AppColors.kMainColor),
      );
}
