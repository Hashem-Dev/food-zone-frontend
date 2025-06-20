import 'package:food_zone/exports.dart';

/// A widget that displays the title for the phone OTP verification screen.
///
/// This widget is responsible for displaying the title text for the phone
/// verification process. It adjusts the font size based on the screen
/// orientation (landscape or portrait).
class PhoneOtpTitle extends StatelessWidget {
  /// Creates a [PhoneOtpTitle] widget.
  ///
  /// The [key] parameter is used to uniquely identify this widget.
  const PhoneOtpTitle({super.key});

  /// Builds the [PhoneOtpTitle] widget.
  ///
  /// This method constructs the widget tree for the title text. It determines
  /// the screen width and adjusts the font size if the device is in landscape
  /// mode.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Text] widget displaying the phone verification title.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.phone_verification,
      style: context.textStyle.headlineMedium!
          .copyWith(fontSize: isLandscape ? 14.sp : null),
    );
  }
}
