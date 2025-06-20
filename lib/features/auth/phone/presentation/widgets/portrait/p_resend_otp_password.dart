import 'package:food_zone/exports.dart';

/// A widget that displays a text for resending OTP password.
///
/// This widget is used in the authentication flow to allow users to resend
/// the OTP password to their email. It adjusts its font size based on the
/// screen orientation (landscape or portrait).
class ResendOtpPassword extends StatelessWidget {
  /// Creates a [ResendOtpPassword] widget.
  const ResendOtpPassword({super.key});

  /// Builds the widget tree for [ResendOtpPassword].
  ///
  /// This method constructs the UI for the resend OTP password text,
  /// which is wrapped in a [GestureDetector] to handle tap events.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Center] widget containing the resend OTP password text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Center(
      child: GestureDetector(
        child: Text(
          context.translate.email_otp_resend,
          style: TextStyle(
            fontSize: isLandscape ? 9.sp : 16.sp,
            fontWeight: FontWeight.w600,
            color: neutral100,
          ),
        ),
      ),
    );
  }
}
