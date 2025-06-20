import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/data/repositories/register.dart';

/// A stateless widget that represents the email form used in the registration process.
class RegisterEmailForm extends StatelessWidget {
  /// Creates a [RegisterEmailForm] widget.
  const RegisterEmailForm({super.key});

  /// Builds the widget tree for the email form.
  ///
  /// This method is responsible for constructing the UI elements of the email form,
  /// including the email input field and its associated decorations and behaviors.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Column] widget containing the email form elements.
  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterRequestController>();
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
        Obx(
          () => TextFormField(
            controller: registerController.emailController,
            focusNode: registerController.emailFocus,
            onChanged: (email) =>
                registerController.emailRequired.value = false,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.emailAddress,
            cursorColor: neutral100,
            maxLines: 1,
            decoration: InputDecoration(
              prefixIcon: const Icon(SolarIconsBold.letter, color: neutral100),
              hintText: context.translate.hint_email,
              hintStyle:
                  context.appTheme.inputDecorationTheme.hintStyle!.copyWith(
                fontSize: isLandscape ? 8.sp : null,
              ),
              errorText: registerController.emailRequired.value
                  ? context.translate.text_form_required
                  : null,
            ),
          ),
        )
      ],
    );
  }
}
