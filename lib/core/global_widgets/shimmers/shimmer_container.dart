import 'package:food_zone/core/global_widgets/shimmers/app_shimmer.dart';
import 'package:food_zone/exports.dart';

/// A widget that displays a shimmering effect over a container.
///
/// This widget is useful for indicating loading states in the UI.
/// The shimmer effect is applied using the [appShimmer] function.
class ShimmerContainer extends StatelessWidget {
  /// Creates a [ShimmerContainer] widget.
  ///
  /// The [width] and [height] parameters are required to define the size of the container.
  const ShimmerContainer({
    super.key,
    required this.width,
    required this.height,
  });

  /// The width of the container.
  final double width;

  /// The height of the container.
  final double height;

  /// Builds the [ShimmerContainer] widget.
  ///
  /// This method returns a widget that displays a container with a shimmer effect.
  /// The shimmer effect is applied using the [appShimmer] function, which takes
  /// the container and the current [BuildContext] as parameters.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A widget that displays a shimmering container.
  @override
  Widget build(BuildContext context) {
    return appShimmer(
      Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? Colors.black
              : neutral50.withValues(alpha: .4),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      context,
    );
  }
}
