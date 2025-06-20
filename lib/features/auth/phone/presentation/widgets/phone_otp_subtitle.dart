import 'package:food_zone/exports.dart';

/// A stateless widget that displays a subtitle for the phone OTP screen.
///
/// This widget shows a text indicating that a code has been sent to a specific phone number.
/// The text style adjusts based on the screen orientation (landscape or portrait).
class PhoneOtpSubtitle extends StatelessWidget {
  /// Creates a [PhoneOtpSubtitle] widget.
  const PhoneOtpSubtitle({super.key});

  /// Builds the widget tree for the [PhoneOtpSubtitle].
  ///
  /// This method constructs a [Text] widget that displays the OTP subtitle.
  /// The text style is adjusted based on the screen width to handle landscape mode.
  ///
  /// @param context The [BuildContext] in which the widget is built.
  /// @returns A [Text] widget displaying the OTP subtitle.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      '${context.translate.code_sent_to_the} (+963) 20 **** *678',
      style: context.textStyle.headlineSmall!
          .copyWith(fontSize: isLandscape ? 8.sp : null),
    );
  }
}
