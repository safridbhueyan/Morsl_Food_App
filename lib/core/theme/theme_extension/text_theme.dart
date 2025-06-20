import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the google_fonts package

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),

    displayMedium: GoogleFonts.poppins(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    titleLarge: GoogleFonts.poppins(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black87,
    ),

    titleSmall: GoogleFonts.poppins(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w500,
      color: Colors.black54,
    ),
    bodyLarge: GoogleFonts.poppins(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    bodyMedium: GoogleFonts.poppins(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
    bodySmall: GoogleFonts.poppins(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.grey,
    ),
  );
}
