import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/manager/forgot_password_email.dart';

class EmailForgotPasswordForm extends StatelessWidget {
  const EmailForgotPasswordForm({super.key});

  /// Builds the widget tree for the email forgot password form.
  ///
  /// This method creates a form that allows users to input their email address
  /// to reset their password. It uses a [TextFormField] to capture the email
  /// input and displays error messages if the input is invalid.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Column] widget containing the email input form.
  ///
  /// The returned [Column] widget is used within a Flutter app to display
  /// the email forgot password form. It includes a [Text] widget for the title
  /// and a [TextFormField] for the email input, with error handling and
  /// responsive design adjustments for landscape mode.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordEmailController());

    final width = context.w;
    final isLandscape = width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          context.translate.email_title,
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: isLandscape ? 8.sp : null,
          ),
        ),
        addVerticalSpace(8),
        Obx(() => TextFormField(
              controller: controller.emailController,
              focusNode: controller.emailFocus,
              onChanged: (email) => controller.emailError.value = false,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              keyboardType: TextInputType.emailAddress,
              cursorColor: neutral100,
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon:
                    const Icon(SolarIconsBold.letter, color: neutral100),
                hintText: context.translate.hint_email,
                hintStyle:
                    context.appTheme.inputDecorationTheme.hintStyle!.copyWith(
                  fontSize: isLandscape ? 8.sp : null,
                ),
                errorText: controller.emailError.value
                    ? context.translate.text_form_required
                    : null,
              ),
            ))
      ],
    );
  }
}
