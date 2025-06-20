import 'package:food_zone/exports.dart';

/// A widget that displays the title for the reset password screen.
///
/// This widget is used to show a localized title text for the reset password
/// screen. It adjusts the font size based on the screen orientation.
class ResetPasswordTitle extends StatelessWidget {
  /// Creates a [ResetPasswordTitle] widget.
  ///
  /// The [key] parameter is used to control how one widget replaces another
  /// widget in the tree.
  const ResetPasswordTitle({super.key});

  /// Builds the [ResetPasswordTitle] widget.
  ///
  /// This method constructs the widget tree for the reset password title.
  /// It determines the screen width and adjusts the font size if the device
  /// is in landscape mode.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Text] widget displaying the reset password title.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.reset_password,
      style: context.textStyle.headlineMedium!
          .copyWith(fontSize: isLandscape ? 15.sp : null),
    );
  }
}
