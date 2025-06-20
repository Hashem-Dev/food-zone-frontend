import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/invalid_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_back_to_login.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_not_receive_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_otp_fields.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_otp_timer.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_resend_code.dart';

class PortraitEmailOtp extends StatelessWidget {
  const PortraitEmailOtp({super.key});

  @override

  /// Builds the widget tree for the email OTP verification screen.
  ///
  /// This method creates a UI for verifying an email OTP (One-Time Password).
  /// It uses the `VerifyOtpController` to manage the state and handle the OTP verification logic.
  /// The UI includes various widgets such as text fields for OTP input, error messages, and buttons for resending the OTP and verifying it.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A `Widget` that represents the email OTP verification screen.
  /// The returned widget is used within a Flutter app to display the OTP verification interface.
  Widget build(BuildContext context) {
    final verifyOtpController = Get.put(VerifyOtpController());

    return Obx(() => verifyOtpController.loading
        ? const Loading()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              addVerticalSpace(16),
              Text(
                context.translate.email_verification_title,
                style: context.textStyle.headlineMedium,
              ),
              addVerticalSpace(8),
              Text(
                '${context.translate.email_verification_sup_title}\n${verifyOtpController.encryptEmail()}',
                style: context.textStyle.headlineSmall,
              ),
              addVerticalSpace(32),
              const Center(child: EmailOtpFields()),
              addVerticalSpace(16),
              Obx(
                () => verifyOtpController.isWrong
                    ? const InvalidEmailOtp()
                    : const SizedBox.shrink(),
              ),
              addVerticalSpace(16),
              const NotReceiveOtp(),
              addVerticalSpace(24),
              const EmailOtpTimer(),
              addVerticalSpace(24),
              const EmailResendCode(),
              const Expanded(child: SizedBox.shrink()),
              Obx(() => FButton(
                    size: true,
                    title: context.translate.verify_button,
                    onPressed: verifyOtpController.otpLength
                        ? () => verifyOtpController.verifyOtp()
                        : null,
                  )),
              addVerticalSpace(24),
              const EmailBackToLogin(),
              addVerticalSpace(16),
            ],
          ));
  }
}
