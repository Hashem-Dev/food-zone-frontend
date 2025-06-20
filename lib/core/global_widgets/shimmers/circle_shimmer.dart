import 'package:food_zone/exports.dart';

import 'app_shimmer.dart';

/// A widget that displays a shimmering circle, typically used as a loading indicator.
///
/// The [CircleShimmer] widget creates a circular shimmer effect with a specified radius.
/// The shimmer effect is achieved using the [appShimmer] function, which wraps a [CircleAvatar].
/// The background color of the shimmer adapts to the current theme (dark or light mode).
///
/// {@tool snippet}
/// This example shows how to use [CircleShimmer] in a Flutter app:
///
/// ```dart
/// CircleShimmer(radius: 50.0)
/// ```
/// {@end-tool}
class CircleShimmer extends StatelessWidget {
  /// Creates a [CircleShimmer] widget.
  ///
  /// The [radius] parameter must not be null and specifies the radius of the circular shimmer.
  const CircleShimmer({super.key, required this.radius});

  /// The radius of the circular shimmer.
  final double radius;

  @override
  Widget build(BuildContext context) {
    /// Builds the [CircleShimmer] widget.
    ///
    /// The [build] method creates a [CircleAvatar] with the specified [radius] and a background color
    /// that adapts to the current theme (dark or light mode). The [CircleAvatar] is wrapped with the
    /// [appShimmer] function to create the shimmer effect.
    ///
    /// @param context The build context in which the widget is built.
    /// @returns A [Widget] that displays a shimmering circle.
    return appShimmer(
      CircleAvatar(
        radius: radius.r,
        backgroundColor:
            context.isDarkMode ? Colors.black : neutral50.withValues(alpha: .4),
      ),
      context,
    );
  }
}
