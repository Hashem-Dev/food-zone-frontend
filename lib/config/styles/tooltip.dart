import 'package:food_zone/exports.dart';

/// Returns a [TooltipThemeData] for the light theme.
///
/// This function configures the tooltip appearance for the light theme,
/// including the trigger mode, text alignment, position preference, and decoration.
///
/// @returns A [TooltipThemeData] object that defines the tooltip style for the light theme.
///
/// The returned [TooltipThemeData] is used within a Flutter app to style tooltips
/// when the light theme is active. It ensures that tooltips have a consistent look
/// and feel across the application.
TooltipThemeData tooltipThemeLight() {
  return TooltipThemeData(
    triggerMode: TooltipTriggerMode.tap,
    textAlign: TextAlign.start,
    preferBelow: true,
    decoration: BoxDecoration(
      color: neutral900,
      borderRadius: BorderRadius.circular(12.r),
    ),
  );
}

/// Returns a [TooltipThemeData] for the dark theme.
///
/// This function configures the tooltip appearance for the dark theme,
/// including the trigger mode, text alignment, position preference, and decoration.
///
/// @returns A [TooltipThemeData] object that defines the tooltip style for the dark theme.
///
/// The returned [TooltipThemeData] is used within a Flutter app to style tooltips
/// when the dark theme is active. It ensures that tooltips have a consistent look
/// and feel across the application.
TooltipThemeData tooltipThemeDark() {
  return TooltipThemeData(
    triggerMode: TooltipTriggerMode.tap,
    textAlign: TextAlign.start,
    preferBelow: true,
    decoration: BoxDecoration(
      color: primaryWhite,
      borderRadius: BorderRadius.circular(12.r),
    ),
  );
}
