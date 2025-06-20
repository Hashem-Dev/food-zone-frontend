import 'package:flutter/gestures.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';

class EmailBackToLogin extends StatelessWidget {
  const EmailBackToLogin({super.key});

  @override

  /// Builds the widget tree for the EmailBackToLogin widget.
  ///
  /// This method constructs a centered RichText widget that displays a
  /// "Back to Login" message. The text is styled differently based on
  /// the screen orientation (landscape or portrait). The "Login" part
  /// of the text is tappable and navigates the user to the LoginView
  /// when tapped.
  ///
  /// @param context The BuildContext in which the widget is built.
  /// @returns A Center widget containing a RichText widget.
  ///
  /// The returned RichText widget is used within a Flutter app to provide
  /// an interactive text element that allows users to navigate back to
  /// the login screen.
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;

    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: context.translate.back_to,
              style: context.textStyle.titleSmall!
                  .copyWith(fontSize: isLandscape ? 8.sp : 16.sp),
            ),
            TextSpan(
              text: context.translate.login,
              style: TextStyle(
                fontSize: isLandscape ? 8.sp : 16.sp,
                color: primary500,
                fontWeight: FontWeight.w600,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAll(const LoginView());
                },
            ),
          ],
        ),
      ),
    );
  }
}
