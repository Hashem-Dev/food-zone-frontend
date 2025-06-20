import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';

class EmailResendCode extends StatelessWidget {
  const EmailResendCode({super.key});

  @override

  /// Builds the widget tree for the EmailResendCode widget.
  ///
  /// This method creates a UI that allows users to resend a verification code
  /// via email. It uses the `Obx` widget to reactively update the UI based on
  /// the state of the `verifyOtpController`. When the resend button is tapped,
  /// it triggers the `resendNewVerificationCode` and `startTimer` methods from
  /// the `verifyOtpController`.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A widget tree containing a centered `GestureDetector` that
  /// displays a text button for resending the verification code.
  Widget build(BuildContext context) {
    final verifyOtpController = Get.find<VerifyOtpController>();
    final width = context.w;
    final isLandscape = width > 600;
    return Obx(
      () => Center(
        child: GestureDetector(
          onTap: verifyOtpController.isButtonDisabled.value
              ? () {}
              : () {
                  verifyOtpController.resendNewVerificationCode();
                  verifyOtpController.startTimer();
                },
          child: Text(
            context.translate.email_otp_resend,
            style: TextStyle(
              fontSize: isLandscape ? 9.sp : 16.sp,
              fontWeight: FontWeight.w600,
              color: verifyOtpController.isButtonDisabled.value
                  ? neutral100
                  : primary500,
            ),
          ),
        ),
      ),
    );
  }
}
