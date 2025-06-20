import 'package:food_zone/exports.dart';

/// Applies a shimmer effect to the given widget.
///
/// This function wraps the provided [widget] with an animation that creates
/// a shimmering effect. The shimmer effect is configured to repeat indefinitely
/// with a specified curve and duration. The color of the shimmer effect is
/// determined based on the current theme mode (dark or light).
///
/// @param widget The widget to which the shimmer effect will be applied.
/// @param context The build context used to determine the theme mode.
/// @returns A widget with a shimmer effect applied.
///
/// The returned widget can be used within a Flutter app to visually indicate
/// loading states or to draw attention to specific UI elements.
Widget appShimmer(Widget widget, BuildContext context) {
  return widget.animate(onPlay: (controller) {
    controller.repeat();
  }).shimmer(
    curve: Curves.easeOutQuint,
    duration: const Duration(seconds: 2),
    color: context.isDarkMode
        ? primary50.withValues(alpha: .2)
        : primary300.withValues(alpha: .5),
  );
}
