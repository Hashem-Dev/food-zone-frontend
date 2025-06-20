import 'package:food_zone/exports.dart';

/// A stateless widget that displays a subtitle in a bottom sheet.
///
/// This widget is used to display a subtitle text in a bottom sheet with
/// responsive font size based on the screen width.
///
/// Example usage:
/// ```dart
/// BottomSheetSubtitle(subtitle: 'Enter your password')
/// ```
class BottomSheetSubtitle extends StatelessWidget {
  /// Creates a [BottomSheetSubtitle] widget.
  ///
  /// The [subtitle] parameter must not be null.
  const BottomSheetSubtitle({super.key, required this.subtitle});

  /// The subtitle text to be displayed.
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      subtitle,
      style: context.textStyle.headlineMedium!
          .copyWith(fontSize: isLandscape ? 7.sp : 14.sp),
      softWrap: true,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
