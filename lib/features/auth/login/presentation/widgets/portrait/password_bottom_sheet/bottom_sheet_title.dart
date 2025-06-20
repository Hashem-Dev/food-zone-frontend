import 'package:food_zone/exports.dart';

/// A widget that displays a title in a bottom sheet.
///
/// This widget is used to display a title in a bottom sheet with a specific
/// style based on the screen orientation (portrait or landscape).
///
/// The title text will be truncated with an ellipsis if it overflows.
class BottomSheetTitle extends StatelessWidget {
  /// Creates a [BottomSheetTitle] widget.
  ///
  /// The [title] parameter must not be null.
  const BottomSheetTitle({super.key, required this.title});

  /// The title text to be displayed.
  final String title;

  /// Builds the [BottomSheetTitle] widget.
  ///
  /// This method determines the screen width and adjusts the font size of the
  /// title text based on whether the screen is in landscape or portrait mode.
  ///
  /// @param context The build context.
  /// @returns A [Text] widget displaying the title.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      title,
      style: context.textStyle.headlineSmall!.copyWith(
          fontSize: isLandscape ? 7.sp : 12.sp, fontWeight: FontWeight.w400),
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
