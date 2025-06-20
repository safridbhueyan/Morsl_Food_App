import 'package:flutter/material.dart';

class AppColorScheme {
  static const Color primaryColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color scaffoldBackgroundColor = Color(0xFFF4F1EC);
  static const Color buttonColor = Color(0xFF9CADA6);
  static const Color errorColor = Color(0xFFD7CCC8);
  static const Color onErrorColor = Color(0xFFEB3D4D);
  static const Color onSurface = Color(0xFFA5A5AB);
  static const Color successfulColor = Color(0xFF04943E);

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
    surface: scaffoldBackgroundColor,
    onPrimary: secondaryColor,
    onSecondary: primaryColor,
    onSurface: onSurface,
    error: errorColor,
    onError: onErrorColor,
    brightness: Brightness.light,
    errorContainer: errorColor,
  );
}
