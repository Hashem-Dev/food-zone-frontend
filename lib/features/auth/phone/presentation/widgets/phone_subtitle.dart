import 'package:food_zone/exports.dart';

/// A stateless widget that displays a subtitle text for the phone authentication screen.
///
/// This widget adapts its font size based on the screen orientation (landscape or portrait).
class PhoneSubtitle extends StatelessWidget {
  /// Creates a [PhoneSubtitle] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget in the widget tree.
  const PhoneSubtitle({super.key});

  /// Builds the [PhoneSubtitle] widget.
  ///
  /// This method constructs the widget tree for the subtitle text, adjusting the font size
  /// based on the screen width to determine if the device is in landscape mode.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Text] widget displaying the subtitle text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.phone_forgot_password_title,
      style: context.textStyle.headlineSmall!
          .copyWith(fontSize: isLandscape ? 8.sp : null),
    );
  }
}
