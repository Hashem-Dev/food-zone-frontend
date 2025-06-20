import 'package:food_zone/exports.dart';

import 'package:food_zone/features/auth/email/presentation/widgets/landscape/l_email_otp.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/portrait/p_email_otp.dart';

/// A stateless widget that represents the email verification code screen.
///
/// This screen displays an AppBar with a title and a body that adapts to the
/// device's orientation using a responsive layout. The body contains either
/// the portrait or landscape version of the email OTP (One-Time Password)
/// input form.
class EmailVerificationCode extends StatelessWidget {
  const EmailVerificationCode({super.key});

  /// Builds the widget tree for the email verification code screen.
  ///
  /// This method constructs a [Scaffold] widget with an [AppBar] and a body
  /// that uses [ResponsiveLayout] to display different widgets based on the
  /// device's orientation.
  ///
  /// @param context The [BuildContext] in which the widget is built.
  /// @returns A [Scaffold] widget containing the email verification code screen.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.translate.verification,
          style: context.textStyle.displaySmall!.copyWith(fontSize: 22.sp),
        ),
      ),
      body: const ResponsiveLayout(
        portrait: PortraitEmailOtp(),
        landscape: LandscapeEmailOtp(),
      ),
    );
  }
}
