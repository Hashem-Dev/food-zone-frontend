import 'package:food_zone/exports.dart';

/// A stateless widget that displays whether a restaurant is opened or closed.
///
/// This widget takes a boolean parameter [isOpened] to determine the state of the restaurant.
/// If [isOpened] is true, the widget displays "OPENED" with a green background.
/// If [isOpened] is false, the widget displays "CLOSED" with a primary color background.
class OpenedRestaurant extends StatelessWidget {
  /// Creates an [OpenedRestaurant] widget.
  ///
  /// The [isOpened] parameter is required to determine the state of the restaurant.
  const OpenedRestaurant({super.key, required this.isOpened});

  /// A boolean value indicating whether the restaurant is opened.
  final bool isOpened;

  /// Builds the widget tree for the [OpenedRestaurant] widget.
  ///
  /// This method returns a [Container] widget with padding, decoration, and a [Text] widget
  /// displaying either "OPENED" or "CLOSED" based on the value of [isOpened].
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Container] widget displaying the state of the restaurant.
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: isOpened ? green700 : primary600,
      ),
      child: Text(
        isOpened ? 'OPENED' : 'CLOSED',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 12.sp,
          color: primaryWhite,
        ),
      ),
    );
  }
}
