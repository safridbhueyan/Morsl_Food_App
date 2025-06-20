import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme_extension/color_scheme.dart';

class AppEvaluatedButtonThemes {
  AppEvaluatedButtonThemes._();

  // Light mode Evaluated Button Theme
  static final lightEvaluatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColorScheme.buttonColor,
      foregroundColor: AppColorScheme.secondaryColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(99.r), // Add border radius
      ),
    ),
  );
}
