import 'package:flutter/material.dart';
import 'package:morsl_app_celina0057/core/theme/part/elevated_button_theme.dart';
import 'package:morsl_app_celina0057/core/theme/part/input_decoration_theme.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/color_scheme.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/text_theme.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColor,
    textTheme: AppTextTheme.lightTextTheme,
    colorScheme: AppColorScheme.lightColorScheme,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppEvaluatedButtonThemes.lightEvaluatedButtonTheme
  );
}