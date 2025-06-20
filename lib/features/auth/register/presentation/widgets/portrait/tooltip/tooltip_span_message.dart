import 'package:food_zone/exports.dart';

/// Creates a [WidgetSpan] that displays a tooltip message with an icon and text.
///
/// The icon changes based on the [check] parameter, displaying a check circle
/// icon if true, or an info circle icon if false. The text color also changes
/// based on the [check] parameter.
///
/// This function is typically used to show validation messages or informational
/// tooltips in the registration feature of the application.
///
/// @param check A boolean that determines which icon and text color to display.
/// @param title The text to display next to the icon.
/// @returns A [WidgetSpan] containing the tooltip message.
WidgetSpan tooltipSpanMessage({
  required bool check,
  required String title,
}) {
  return WidgetSpan(
    child: Column(children: [
      Row(mainAxisSize: MainAxisSize.min, children: [
        Container(
          width: 18.w,
          height: 18.w,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: check
              ? const Icon(SolarIconsOutline.checkCircle,
                      size: 16, color: green500)
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500))
              : const Icon(SolarIconsOutline.infoCircle, size: 16),
        ),
        addHorizontalSpace(3),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            color: check ? green500 : primary400,
          ),
        ),
      ]).animate().fadeIn(
          curve: Curves.easeInCirc, duration: const Duration(milliseconds: 300))
    ]),
  );
}
