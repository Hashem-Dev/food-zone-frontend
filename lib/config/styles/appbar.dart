import 'package:food_zone/exports.dart';

/// Generates the AppBar theme for light mode.
///
/// This function returns an [AppBarTheme] configured for light mode,
/// setting the background color, elevation, shadow color, and title text style.
///
/// @param context The [BuildContext] to access theme-related properties.
/// @returns An [AppBarTheme] configured for light mode.
AppBarTheme appBarThemeLight(BuildContext context) {
  return AppBarTheme(
    backgroundColor: primaryWhite,
    elevation: 0,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: context.isPhone ? 25.sp : 15.sp,
      color: neutral900,
    ),
  );
}

/// Generates the AppBar theme for dark mode.
///
/// This function returns an [AppBarTheme] configured for dark mode,
/// setting the background color, elevation, shadow color, and title text style.
///
/// @param context The [BuildContext] to access theme-related properties.
/// @returns An [AppBarTheme] configured for dark mode.
AppBarTheme appBarThemeDark(BuildContext context) {
  return AppBarTheme(
    backgroundColor: neutral900,
    elevation: 0,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: context.isPhone ? 25.sp : 15.sp,
      color: primaryWhite,
    ),
  );
}
