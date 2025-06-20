import 'package:food_zone/exports.dart';

class InvalidEmailOtp extends StatelessWidget {
  const InvalidEmailOtp({super.key});

  @override

  /// Builds the widget tree for the InvalidEmailOtp widget.
  ///
  /// This method constructs a Center widget containing a Text widget that displays
  /// an invalid code message. The text style is adjusted based on the screen width
  /// to provide a responsive design.
  ///
  /// @param context The BuildContext in which the widget is built.
  /// @returns A Center widget containing a Text widget with a styled invalid code message.
  ///
  /// The returned widget is used within a Flutter app to inform the user that the
  /// entered OTP code is invalid. It adapts its font size based on the device's
  /// orientation to ensure readability.
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Center(
      child: Text(
        context.translate.invalid_code,
        style: TextStyle(
          color: primary500,
          fontWeight: FontWeight.w400,
          fontSize: isLandscape ? 10.sp : 16.sp,
        ),
      ),
    );
  }
}
