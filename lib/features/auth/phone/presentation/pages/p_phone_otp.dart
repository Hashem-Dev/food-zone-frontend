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

/// A stateless widget that represents the portrait layout for the phone OTP screen.
///
/// This widget includes various components such as the title, subtitle, OTP field,
/// invalid OTP message, not received OTP message, OTP timer, resend OTP button,
/// and a back to login button.
///
/// The widget is used to verify the OTP sent to the user's phone number.
///
/// Example usage:
/// ```dart
/// PortraitPhoneOtp();
/// ```
class PortraitPhoneOtp extends StatelessWidget {
  /// Creates a [PortraitPhoneOtp] widget.
  const PortraitPhoneOtp({super.key});

  /// Builds the widget tree for the portrait phone OTP screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the portrait phone OTP screen.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(16),
        const PhoneOtpTitle(),
        addVerticalSpace(8),
        const PhoneOtpSubtitle(),
        addVerticalSpace(32),
        const PasswordOtpField(),
        addVerticalSpace(16),
        if (true) const InvalidOtpPassword(),
        addVerticalSpace(16),
        const NotReceiveOtpPassword(),
        addVerticalSpace(24),
        const OtpTimerPassword(),
        addVerticalSpace(24),
        const ResendOtpPassword(),
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
    );
  }
}
