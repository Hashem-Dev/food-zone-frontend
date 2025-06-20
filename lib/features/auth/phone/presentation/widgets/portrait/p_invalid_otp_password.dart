import 'package:food_zone/exports.dart';

/// A stateless widget that displays an invalid OTP password message.
///
/// This widget is used to inform the user that the OTP code they entered is invalid.
/// It adjusts its font size based on the screen orientation (landscape or portrait).
class InvalidOtpPassword extends StatelessWidget {
  /// Creates an instance of [InvalidOtpPassword].
  ///
  /// The [key] parameter is optional and can be used to control the widget's state.
  const InvalidOtpPassword({super.key});

  /// Builds the widget tree for the [InvalidOtpPassword] widget.
  ///
  /// This method is called whenever the widget needs to be rendered.
  /// It uses the [BuildContext] to determine the screen width and orientation,
  /// and displays a centered text message with appropriate styling.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree representing the invalid OTP password message.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;

    return Center(
      child: Text(
        context.translate.invalid_code,
        style: TextStyle(
          color: primary500,
          fontWeight: FontWeight.w400,
          fontSize: isLandscape ? 9.sp : 16.sp,
        ),
      ),
    );
  }
}
