import 'package:food_zone/exports.dart';
import 'l_phone_otp.dart';
import 'p_phone_otp.dart';

/// A stateless widget that represents the phone verification code screen.
///
/// This screen displays a scaffold with an app bar and a responsive layout
/// for portrait and landscape orientations. The app bar contains a gradient
/// title that translates to the verification text.
///
/// The body of the scaffold uses the `ResponsiveLayout` widget to display
/// either the `PortraitPhoneOtp` or `LandscapePhoneOtp` widget based on the
/// device orientation.
class PhoneVerificationCode extends StatelessWidget {
  /// Creates a [PhoneVerificationCode] widget.
  const PhoneVerificationCode({super.key});

  /// Builds the widget tree for the phone verification code screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Scaffold] widget containing the app bar and responsive layout.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientAppbarTitle(
          title: context.translate.verification,
        ),
      ),
      body: const ResponsiveLayout(
        portrait: PortraitPhoneOtp(),
        landscape: LandscapePhoneOtp(),
      ),
    );
  }
}
