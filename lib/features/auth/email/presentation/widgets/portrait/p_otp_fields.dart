import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';

import 'package:pinput/pinput.dart';

class EmailOtpFields extends StatelessWidget {
  const EmailOtpFields({super.key});

  /// Builds the OTP input fields widget.
  ///
  /// This method constructs a widget that displays a set of input fields for
  /// entering an OTP (One-Time Password). It uses the `Pinput` package to
  /// create the input fields with customized themes for default, error, focused,
  /// and following states. The OTP input fields are controlled by the
  /// `VerifyOtpController` which manages the OTP text and error states.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A widget that displays the OTP input fields.
  ///
  /// The returned widget is used within a Flutter app to allow users to enter
  /// an OTP for verification purposes. It provides visual feedback for different
  /// states (default, error, focused, following) and updates the controller
  /// based on user input.
  @override
  Widget build(BuildContext context) {
    final verifyTypeController = Get.put(VerifyOtpController());

    final width = context.w;
    return Obx(
      () => Pinput(
        controller: verifyTypeController.otpTextController,
        length: 6,
        keyboardType: TextInputType.number,
        forceErrorState: verifyTypeController.isWrong,
        defaultPinTheme: PinTheme(
          width: width < 600 ? 51 : 60.w,
          height: width < 600 ? 51 : 60.h,
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
          width: width < 600 ? 51 : 60.w,
          height: width < 600 ? 51 : 60.h,
          decoration: BoxDecoration(
            border: Border.all(
              width: .5,
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          textStyle: context.textStyle.headlineLarge!
              .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        focusedPinTheme: PinTheme(
          width: width < 600 ? 51 : 60.w,
          height: width < 600 ? 51 : 60.h,
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
          width: width < 600 ? 51 : 60.w,
          height: width < 600 ? 51 : 60.h,
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
        onChanged: (otp) {
          verifyTypeController.checkOtpLength();
          verifyTypeController.setErrorOtpState();
        },
      ),
    );
  }
}
