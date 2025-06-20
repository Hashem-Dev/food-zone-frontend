import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/manager/forgot_password_email.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_subtitle.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_text_form.dart';
import 'package:food_zone/features/auth/email/presentation/widgets/email_title.dart';

class PortraitEmail extends StatelessWidget {
  const PortraitEmail({super.key});

  @override

  /// Builds the widget tree for the portrait email screen.
  ///
  /// This method creates a column layout containing the email title, subtitle,
  /// forgot password form, and a button to send the verification password code.
  /// The [ForgotPasswordEmailController] is used to handle the button's onPressed event.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [SizedBox] containing the layout for the portrait email screen.
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordEmailController());
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const EmailTitle(),
          addVerticalSpace(8),
          const EmailSubtitle(),
          addVerticalSpace(32),
          const EmailForgotPasswordForm(),
          const Expanded(child: SizedBox.shrink()),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: FButton(
              size: true,
              title: context.translate.bottom_sheet_btn_name,
              onPressed: () => controller.sendVerificationPasswordCode(context),
            ),
          ),
        ],
      ),
    );
  }
}
