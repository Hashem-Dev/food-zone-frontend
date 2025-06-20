import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';

class EmailOtpTimer extends StatelessWidget {
  const EmailOtpTimer({super.key});

  @override

  /// Builds the widget tree for the EmailOtpTimer.
  ///
  /// This method initializes the OTP timer by calling `startTimer` on the
  /// `VerifyOtpController` and constructs a `Row` widget that displays a clock
  /// icon and the formatted remaining time for the OTP. The text size adjusts
  /// based on the screen orientation.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A `Row` widget containing an icon and a text displaying the
  /// formatted OTP timer.
  ///
  /// The returned `Row` widget is used within a Flutter app to visually
  /// represent the countdown timer for OTP verification, enhancing the user
  /// experience by providing a clear indication of the remaining time.
  Widget build(BuildContext context) {
    final verifyOtpController = Get.find<VerifyOtpController>();
    verifyOtpController.startTimer();
    final width = context.w;
    final isLandscape = width > 600;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(SolarIconsOutline.clockCircle, size: 20),
        addHorizontalSpace(isLandscape ? 8 : 16),
        Obx(
          () => Text(
            verifyOtpController.formattedTime,
            style: context.textStyle.displaySmall!.copyWith(
              fontSize: isLandscape ? 9.sp : 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
