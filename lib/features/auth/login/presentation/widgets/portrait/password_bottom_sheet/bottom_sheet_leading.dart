import 'package:food_zone/exports.dart';

/// A widget that displays an icon inside a container with specific dimensions and styling.
///
/// The dimensions of the container are responsive to the screen width.
/// The container has a border radius and a background color with a specified alpha value.
///
/// This widget is typically used as a leading icon in a bottom sheet.
///
/// Example usage:
/// ```dart
/// BottomSheetLeading(icon: Icons.lock);
/// ```
class BottomSheetLeading extends StatelessWidget {
  /// Creates a [BottomSheetLeading] widget.
  ///
  /// The [icon] parameter must not be null.
  const BottomSheetLeading({super.key, required this.icon});

  /// The icon to be displayed inside the container.
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final width = context.w;
    return Container(
      width: width < 600 ? 44.w : 22.w,
      height: width < 600 ? 44.w : 22.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: primary500.withValues(alpha: .1),
      ),
      child: Icon(icon),
    );
  }
}
