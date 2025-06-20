import 'package:food_zone/exports.dart';

/// A widget that displays a subtitle for the reset password screen.
///
/// This widget shows a text indicating that the new password must be different
/// from the old password. The text style adjusts based on the screen orientation.
class ResetPasswordSubtitle extends StatelessWidget {
  /// Creates a [ResetPasswordSubtitle] widget.
  const ResetPasswordSubtitle({super.key});

  /// Builds the [ResetPasswordSubtitle] widget.
  ///
  /// This method constructs the widget tree for the subtitle text. It adjusts
  /// the font size based on the screen width to ensure readability in both
  /// portrait and landscape orientations.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Text] widget displaying the subtitle.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.password_must_be_different,
      style: context.textStyle.headlineSmall!
          .copyWith(fontSize: isLandscape ? 8.sp : null),
    );
  }
}
