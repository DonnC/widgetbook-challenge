import 'package:flutter/material.dart';

/// main app [Theme] colors
class AppColors {
  /// light theme: main color
  static const kWhiteColor = Color(0xFFFCFCFC);

  /// light mode: main primary color
  static const kMainColor = Color(0xFF2A85FF);

  /// light mode: main [Scaffold] background color
  static const kBackgroundColor = Color(0xFFF4F4F4);

  /// light: ui shade color
  static const kShadeColor = Color(0xFF9A9FA5);

  /// light theme: [TextField] fill color
  static const kTextFieldFillColor = Color.fromARGB(255, 239, 239, 241);

  /// dark theme: main color
  static const kDarkModeColor = Color(0xFF1A1D1F);

  /// dark theme: [TextField] fill color
  static const kDarkModeFillColor = Color(0xFF111315);

  /// dark theme: [Text] fill color
  static const kDarkModeTextFaintColor = Color(0xFF272B30);

  /// general: preffered warning indicator
  static const kOrangeIndicatorColor = Color(0xFFFFBC99);

  /// general: preffered danger indicator for text
  static const kRedIndicatorColor = Color(0xFFFF6A55);

  /// general: preffered success indicator
  static const kGreenIndicatorColor = Color(0xFF83BF6E);
}
