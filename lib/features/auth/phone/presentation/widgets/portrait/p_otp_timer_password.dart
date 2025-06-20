import 'package:food_zone/exports.dart';

/// A widget that displays a timer with an icon and text.
///
/// This widget is used to show a countdown timer for OTP (One Time Password)
/// verification in the authentication flow. It adapts its layout based on the
/// screen width to provide a responsive design.
class OtpTimerPassword extends StatelessWidget {
  /// Creates an [OtpTimerPassword] widget.
  const OtpTimerPassword({super.key});

  /// Builds the [OtpTimerPassword] widget.
  ///
  /// This method constructs the widget tree for the timer, including an icon
  /// and a text displaying the remaining time. The layout adjusts based on
  /// whether the device is in landscape or portrait mode.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Row] widget containing the timer icon and text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 400;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(SolarIconsOutline.clockCircle, size: 20),
        addHorizontalSpace(isLandscape ? 8 : 16),
        Text(
          '00:20',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: isLandscape ? 9.sp : 16.sp,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
