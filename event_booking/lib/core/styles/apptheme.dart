import 'package:flutter/material.dart';
import 'package:event_booking/core/styles/color.dart';
import 'package:event_booking/core/constant/app_font.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: AppFonts.airbnbcereal,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      onSurface: AppColors.titleColor,
    ),
  );
}
