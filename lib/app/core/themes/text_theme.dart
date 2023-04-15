
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AppTextTheme {
  static final textTheme = TextTheme(
  displayLarge: GoogleFonts.openSans(
    fontSize: 113.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -1.5
  ),
  displayMedium: GoogleFonts.openSans(
    fontSize: 70.sp,
    fontWeight: FontWeight.w300,
    letterSpacing: -0.5,
    color: Colors.black,
  ),
  displaySmall: GoogleFonts.openSans(
    fontSize: 56.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  headlineMedium: GoogleFonts.openSans(
    fontSize: 40.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
    color: Colors.black,
  ),
  headlineSmall: GoogleFonts.openSans(
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  ),
  titleLarge: GoogleFonts.openSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    // letterSpacing: 0.15,
    color: Colors.black,
  ),
  titleMedium: GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.15,
    color: Colors.black,
  ),
  titleSmall: GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // letterSpacing: 0.1,
    color: Colors.black,
  ),
  bodyLarge: GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.5,
    color: Colors.black,
  ),
  bodyMedium: GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.25,
    color: Colors.black,
  ),
  labelLarge: GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    // letterSpacing: 1.25,
    color: Colors.black,
  ),
  bodySmall: GoogleFonts.openSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    // letterSpacing: 0.4,
    color: Colors.black,
  ),
  labelSmall: GoogleFonts.openSans(
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    letterSpacing: 1.5,
    color: Colors.black,
  ),
);
}