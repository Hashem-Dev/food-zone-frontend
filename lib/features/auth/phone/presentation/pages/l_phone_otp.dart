import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_back_to_login.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/phone_otp_subtitle.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/phone_otp_title.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_invalid_otp_password.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_not_receive_otp_password.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_otp_timer_password.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_password_otp_field.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_resend_otp_password.dart';

/// A stateless widget that represents the landscape layout for the phone OTP screen.
///
/// This widget is used to display the phone OTP screen in landscape mode.
/// It includes the OTP title, subtitle, OTP input field, and various other widgets
/// related to OTP verification.
///
/// {@tool snippet}
/// Example usage:
/// ```dart
/// LandscapePhoneOtp();
/// ```
/// {@end-tool}
class LandscapePhoneOtp extends StatelessWidget {
  /// Creates a [LandscapePhoneOtp] widget.
  const LandscapePhoneOtp({super.key});

  /// Builds the landscape layout for the phone OTP screen.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the landscape layout for the phone OTP screen.
  @override
  Widget build(BuildContext context) {
    final width = context.w;

    return Padding(
      padding: EdgeInsets.only(left: 8.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(8),
                const PhoneOtpTitle(),
                addVerticalSpace(8),
                const PhoneOtpSubtitle(),
                const Expanded(child: SizedBox.shrink()),
                FButton(
                  title: context.translate.verify_button,
                  onPressed: () => log(
                    'Verify OTP Password',
                  ),
                ),
                addVerticalSpace(16),
                const EmailBackToLogin(),
                addVerticalSpace(16),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width > 600 ? 180.w : null,
                    child: const PasswordOtpField()),
                addVerticalSpace(16),
                if (true) const InvalidOtpPassword(),
                addVerticalSpace(16),
                const NotReceiveOtpPassword(),
                addVerticalSpace(24),
                const OtpTimerPassword(),
                addVerticalSpace(24),
                const ResendOtpPassword(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
