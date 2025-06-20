import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morsl_app_celina0057/core/theme/theme_extension/color_scheme.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    hintStyle: GoogleFonts.nunito(color: Color(0xFF777980),fontSize: 16.sp,fontWeight: FontWeight.w400),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.onSurface),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.buttonColor),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.onErrorColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: AppColorScheme.onSurface),
    ),
  );

}
