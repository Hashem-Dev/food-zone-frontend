import 'package:food_zone/exports.dart';

/// A stateless widget that displays the title for the phone authentication screen.
///
/// This widget is responsible for displaying a localized title text, which adapts
/// its font size based on the screen orientation (landscape or portrait).
class PhoneTitle extends StatelessWidget {
  /// Creates a [PhoneTitle] widget.
  ///
  /// The [key] parameter is optional and can be used to control the widget's
  /// state in the widget tree.
  const PhoneTitle({super.key});

  /// Builds the [PhoneTitle] widget.
  ///
  /// This method constructs the widget tree for the [PhoneTitle] widget. It
  /// determines the screen width and checks if the device is in landscape mode.
  /// Based on the orientation, it adjusts the font size of the title text.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Text] widget displaying the localized title text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.forgot_password,
      style: context.textStyle.headlineMedium!
          .copyWith(fontSize: isLandscape ? 15.sp : null),
    );
  }
}
