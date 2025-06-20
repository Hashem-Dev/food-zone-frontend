import 'package:food_zone/exports.dart';

/// A stateless widget that displays a subtitle for the login screen.
///
/// This widget adapts its font size based on the screen orientation.
/// If the screen width is greater than 600 pixels, it is considered
/// to be in landscape mode, and the font size is adjusted accordingly.
class LoginSubtitle extends StatelessWidget {
  /// Creates a [LoginSubtitle] widget.
  const LoginSubtitle({super.key});

  /// Builds the [LoginSubtitle] widget.
  ///
  /// This method uses the [BuildContext] to determine the screen width
  /// and adjusts the font size of the subtitle text based on whether
  /// the screen is in landscape mode.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Text] widget displaying the login subtitle.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.login_sup_title,
      style: context.textStyle.headlineSmall!.copyWith(
        fontSize: isLandscape ? 8.sp : null,
      ),
    );
  }
}
