import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/config/theme/colors.dart';

/// Returns the light theme for input decorations.
///
/// The light theme includes settings for filled backgrounds, padding,
/// hint styles, and border styles.
///
/// @returns An [InputDecorationTheme] configured for light mode.
InputDecorationTheme inputDecorationLight() {
  return InputDecorationTheme(
    filled: true,
    fillColor: primary500.withValues(alpha: .05),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: 16.h,
      horizontal: 16.w,
    ),
    hintFadeDuration: const Duration(milliseconds: 250),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: neutral900.withValues(alpha: .3),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral50, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral50, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral100, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: primary700, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: primary700, width: 1),
    ),
  );
}

/// Returns the dark theme for input decorations.
///
/// The dark theme includes settings for filled backgrounds, padding,
/// hint styles, and border styles.
///
/// @returns An [InputDecorationTheme] configured for dark mode.
InputDecorationTheme inputDecorationDark() {
  return InputDecorationTheme(
    filled: true,
    fillColor: primaryWhite.withValues(alpha: .1),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(
      vertical: 16.h,
      horizontal: 16.w,
    ),
    hintFadeDuration: const Duration(milliseconds: 250),
    hintStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16.sp,
      color: neutral400,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral400, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral400, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: neutral100, width: 1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: primary700, width: 1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(color: primary700, width: 1),
    ),
  );
}
