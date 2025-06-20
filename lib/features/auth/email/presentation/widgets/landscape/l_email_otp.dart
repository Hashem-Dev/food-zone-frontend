import 'package:food_zone/exports.dart';

import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/invalid_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_back_to_login.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_not_receive_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_otp_fields.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_otp_timer.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_resend_code.dart';

class LandscapeEmailOtp extends StatelessWidget {
  const LandscapeEmailOtp({super.key});

  /// Builds the landscape layout for the email OTP verification screen.
  ///
  /// This method constructs a responsive UI for verifying an email OTP in landscape mode.
  /// It uses the `verifyOtpController` to manage the OTP verification process and display
  /// appropriate widgets based on the verification state.
  ///
  /// The layout consists of two main sections:
  /// 1. A column with the email verification title, subtitle, and a verify button.
  /// 2. A column with OTP input fields, error messages, and additional options like
  ///    resending the OTP or going back to the login screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree representing the landscape email OTP verification screen.
  ///
  /// The returned widget tree is used within a Flutter app to display the email OTP
  /// verification screen in landscape mode. It ensures a responsive and user-friendly
  /// interface for users to enter and verify their OTP.
  @override
  Widget build(BuildContext context) {
    final verifyOtpController = Get.find<VerifyOtpController>();
    final width = context.w;

    return Obx(() => verifyOtpController.loading
        ? const Loading()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      addVerticalSpace(8),
                      Text(
                        context.translate.email_verification_title,
                        style: context.textStyle.headlineMedium!
                            .copyWith(fontSize: 12.sp),
                      ),
                      addVerticalSpace(4),
                      Text(
                        '${context.translate.email_verification_sup_title}\n${verifyOtpController.encryptEmail()}',
                        style: context.textStyle.headlineSmall!
                            .copyWith(fontSize: 6.sp),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      FButton(
                        title: context.translate.verify_button,
                        onPressed: verifyOtpController.otpLength
                            ? () => verifyOtpController.verifyOtp()
                            : null,
                      ),
                      addVerticalSpace(24),
                      const EmailBackToLogin(),
                      addVerticalSpace(24),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: width > 400 ? 180.w : null,
                          child: const EmailOtpFields()),
                      addVerticalSpace(16),
                      if (verifyOtpController.isWrong) const InvalidEmailOtp(),
                      addVerticalSpace(16),
                      const NotReceiveOtp(),
                      addVerticalSpace(24),
                      const EmailOtpTimer(),
                      addVerticalSpace(24),
                      const EmailResendCode(),
                    ],
                  ),
                ),
              ],
            ),
          ));
  }
}
