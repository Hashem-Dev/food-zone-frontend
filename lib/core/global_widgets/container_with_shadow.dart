import 'package:food_zone/exports.dart';

/// A container widget that provides a shadow effect and customizable properties.
///
/// The [ContainerWithShadow] widget wraps a child widget and applies a shadow effect
/// along with optional customization for border radius, dark mode color, and margin.
class ContainerWithShadow extends StatelessWidget {
  const ContainerWithShadow({
    super.key,
    required this.child,
    this.radius,
    this.darkColor,
    this.margin,
  });

  /// The widget below this widget in the tree.
  final Widget child;

  /// The radius of the container's border.
  final double? radius;

  /// The color of the container when in dark mode.
  final Color? darkColor;

  /// The margin around the container.
  final EdgeInsets? margin;

  @override

  /// Builds the [ContainerWithShadow] widget.
  ///
  /// This method creates a [Container] with a shadow effect, border radius, and
  /// optional dark mode color and margin. The container's color changes based on
  /// the current theme mode (dark or light).
  ///
  /// @param context The build context.
  /// @returns A [Container] widget with the specified properties and shadow effect.
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: context.isDarkMode ? darkColor ?? neutral700 : primaryWhite,
          borderRadius: BorderRadius.circular(radius?.r ?? 8.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0D0A2C).withAlpha((0.06 * 255).toInt()),
              offset: const Offset(0, 4),
              blurRadius: 6,
            )
          ]),
      child: child,
    );
  }
}
