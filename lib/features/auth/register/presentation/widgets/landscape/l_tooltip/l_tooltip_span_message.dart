import 'package:food_zone/exports.dart';

/// Creates a [WidgetSpan] that displays a tooltip message with an icon and text.
///
/// The tooltip message can either show a check icon or an info icon based on the [check] parameter.
/// The text color also changes based on the [check] parameter.
///
/// @param check A boolean value that determines which icon to display.
/// @param title The text to display in the tooltip message.
/// @returns A [WidgetSpan] containing the tooltip message.
///
/// Example usage:
/// ```dart
/// lTooltipSpanMessage(check: true, title: 'Success');
/// ```
WidgetSpan lTooltipSpanMessage({required bool check, required String title}) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.bottom,
    child: SizedBox(
      width: 220.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 6.sp,
                    color: check ? green500 : primary400,
                  ),
                ),
              ],
            ),
          )
        ],
      ).animate().fadeIn(
          curve: Curves.easeInCirc,
          duration: const Duration(milliseconds: 300)),
    ),
  );
}
