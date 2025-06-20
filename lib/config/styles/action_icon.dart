import 'package:food_zone/exports.dart';

/// Returns the light theme data for action icons.
///
/// This function creates an [ActionIconThemeData] object with a back button icon
/// that has a light theme style.
///
/// @returns An [ActionIconThemeData] object with light theme settings.
ActionIconThemeData actionIconThemeDataLight() {
  return ActionIconThemeData(
    /// Builds the back button icon for the light theme.
    ///
    /// @param context The [BuildContext] in which the widget is built.
    /// @returns A [GestureDetector] widget containing the back button icon.
    backButtonIconBuilder: (BuildContext context) => GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 42.w,
        height: 42.w,

        /// Decorates the container with a box shadow and shape.
        ///
        /// @param boxShadow The list of [BoxShadow] to apply.
        /// @param shape The shape of the container.
        /// @param color The background color of the container.
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0D0A2C).withValues(alpha: .06),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          shape: BoxShape.circle,
          color: primaryWhite,
        ),

        /// The icon displayed inside the container.
        ///
        /// @param context.isEn Determines the direction of the arrow icon.
        /// @param size The size of the icon.
        child: Icon(
          context.isEn
              ? SolarIconsOutline.arrowLeft
              : SolarIconsOutline.arrowRight,
          size: 19.sp,
        ),
      ),
    ),
  );
}

/// Returns the dark theme data for action icons.
///
/// This function creates an [ActionIconThemeData] object with a back button icon
/// that has a dark theme style.
///
/// @returns An [ActionIconThemeData] object with dark theme settings.
ActionIconThemeData actionIconThemeDataDark() {
  return ActionIconThemeData(
    /// Builds the back button icon for the dark theme.
    ///
    /// @param context The [BuildContext] in which the widget is built.
    /// @returns A [GestureDetector] widget containing the back button icon.
    backButtonIconBuilder: (BuildContext context) => GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        width: 42.w,
        height: 42.w,

        /// Decorates the container with a shape and color.
        ///
        /// @param shape The shape of the container.
        /// @param color The background color of the container.
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: primaryWhite.withValues(alpha: .1),
        ),

        /// The icon displayed inside the container.
        ///
        /// @param context.isEn Determines the direction of the arrow icon.
        /// @param size The size of the icon.
        child: Icon(
          context.isEn
              ? SolarIconsOutline.arrowLeft
              : SolarIconsOutline.arrowRight,
          size: 19.sp,
        ),
      ),
    ),
  );
}
