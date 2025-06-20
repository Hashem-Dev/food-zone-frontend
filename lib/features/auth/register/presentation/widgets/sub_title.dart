import 'package:food_zone/exports.dart';

/// A stateless widget that displays a subtitle for the registration screen.
///
/// This widget adjusts its text style based on the screen orientation.
class RegisterSupTitle extends StatelessWidget {
  /// Creates a [RegisterSupTitle] widget.
  ///
  /// The [key] parameter is used to control the widget's state.
  const RegisterSupTitle({super.key});

  /// Builds the [RegisterSupTitle] widget.
  ///
  /// This method determines the screen width and adjusts the text style
  /// accordingly. If the screen width is greater than 600 pixels, it assumes
  /// the device is in landscape mode and applies a smaller font size.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Text] widget displaying the subtitle.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      textAlign: TextAlign.start,
      context.translate.register_sup_title,
      style: isLandscape
          ? context.textStyle.headlineSmall!.copyWith(fontSize: 7.sp)
          : context.textStyle.headlineSmall,
    );
  }
}
