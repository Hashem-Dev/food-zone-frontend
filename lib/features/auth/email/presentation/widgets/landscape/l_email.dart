import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/manager/forgot_password_email.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_subtitle.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_text_form.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_title.dart';

class LandscapeEmail extends StatelessWidget {
  const LandscapeEmail({super.key});

  @override

  /// Builds the landscape layout for the email authentication screen.
  ///
  /// This method constructs a widget tree that includes the email title,
  /// subtitle, and a form for entering the email address to reset the password.
  /// It also includes a button to send the verification code.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] that represents the landscape layout for the email
  /// authentication screen.
  ///
  /// The returned [Widget] is used within a Flutter app to display the email
  /// authentication screen in landscape mode. It ensures that the UI elements
  /// are properly aligned and spaced for a better user experience.
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordEmailController());
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmailTitle(),
                addVerticalSpace(15),
                const EmailSubtitle(),
                addVerticalSpace(context.h / 4),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const EmailForgotPasswordForm(),
                addVerticalSpace(15),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: FButton(
                    title: context.translate.bottom_sheet_btn_name,
                    onPressed: () {
                      controller.sendVerificationPasswordCode(context);
                    },
                  ),
                ),
                addVerticalSpace(context.h / 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
