
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../values/colors.dart';
import 'text_theme.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      color: ColorConstant.green,
      toolbarHeight: 40.h,
      elevation: 5),
    textTheme: AppTextTheme.textTheme,
  );
}