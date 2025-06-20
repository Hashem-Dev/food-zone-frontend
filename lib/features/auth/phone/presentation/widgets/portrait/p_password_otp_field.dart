import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:pinput/pinput.dart';

/// A stateless widget that represents a password OTP (One-Time Password) input field.
///
/// This widget uses the `Pinput` package to create a customizable OTP input field.
/// It adapts its size based on the screen orientation (portrait or landscape).
class PasswordOtpField extends StatelessWidget {
  /// Creates a [PasswordOtpField] widget.
  const PasswordOtpField({super.key});

  /// Builds the widget tree for the [PasswordOtpField].
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree containing the OTP input field.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Center(
      child: Pinput(
        length: 6,
        keyboardType: TextInputType.number,
        defaultPinTheme: PinTheme(
          width: isLandscape ? 60.w : 51.w,
          height: isLandscape ? 60.h : 51.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: context
                  .appTheme.inputDecorationTheme.border!.borderSide.color,
            ),
            borderRadius: BorderRadius.circular(8.r),
            color: context.appTheme.inputDecorationTheme.fillColor,
          ),
          textStyle: context.textStyle.headlineLarge!
              .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        errorPinTheme: PinTheme(
          width: isLandscape ? 60.w : 51.w,
          height: isLandscape ? 60.h : 51.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: primary500,
            ),
            borderRadius: BorderRadius.circular(8.r),
            color: context.appTheme.inputDecorationTheme.fillColor,
          ),
          textStyle: context.textStyle.headlineLarge!
              .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        focusedPinTheme: PinTheme(
          width: isLandscape ? 60.w : 51.w,
          height: isLandscape ? 60.h : 51.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: neutral100,
            ),
            borderRadius: BorderRadius.circular(8.r),
            color: context.appTheme.inputDecorationTheme.fillColor,
          ),
          textStyle: context.textStyle.headlineLarge!
              .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        followingPinTheme: PinTheme(
          width: isLandscape ? 60.w : 51.w,
          height: isLandscape ? 60.h : 51.h,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: primary500.withOpacity(.1)),
              borderRadius: BorderRadius.circular(8.r),
              color: primary500.withOpacity(.1)),
          textStyle: context.textStyle.headlineLarge!.copyWith(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        cursor: Container(
          width: 2,
          height: 20.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: primary500,
          ),
        ),
        onChanged: (otp) => log(otp),
      ),
    );
  }
}
