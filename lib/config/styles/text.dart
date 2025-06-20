import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_zone/config/theme/colors.dart';

/// Returns a [TextTheme] for light mode.
///
/// This function defines a set of text styles that are used throughout the app when the light theme is active.
/// It includes styles for various text elements such as title, headline, and display texts, ensuring consistency
/// in typography across the app.
///
/// @returns A [TextTheme] configured for light mode, which can be used in the [ThemeData] of a Flutter app.
///
/// Example:
/// ```dart
/// ThemeData(
///   textTheme: textThemeLight(),
///   // other theme properties
/// );
/// ```
TextTheme textThemeLight() {
  return TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      color: neutral900,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      color: neutral900,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: neutral100,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: neutral900,
    ),
    titleSmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: neutral900,
    ),
    displayMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: neutral200,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: neutral900,
    ),
  );
}

/// Returns a [TextTheme] for dark mode.
///
/// This function defines a set of text styles that are used throughout the app when the dark theme is active.
/// It includes styles for various text elements such as title, headline, and display texts, ensuring consistency
/// in typography across the app.
///
/// @returns A [TextTheme] configured for dark mode, which can be used in the [ThemeData] of a Flutter app.
///
/// Example:
/// ```dart
/// ThemeData(
///   textTheme: textThemeDark(),
///   // other theme properties
/// );
/// ```
TextTheme textThemeDark() {
  return TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      color: primaryWhite,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: primaryWhite,
    ),
    titleSmall: TextStyle(
      fontSize: 11.sp,
      fontWeight: FontWeight.w400,
      color: neutral100,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 32.sp,
      color: primaryWhite,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: neutral100,
    ),
    displayMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: neutral300,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14.sp,
      color: neutral100,
    ),
  );
}
