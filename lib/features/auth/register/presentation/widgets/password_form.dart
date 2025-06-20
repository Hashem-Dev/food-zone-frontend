import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/data/repositories/register.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/landscape/l_tooltip/l_password_tooltip.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/portrait/tooltip/password_tooltip.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/suffix_password_form.dart';

/// A stateless widget that represents the password form in the registration process.
class RegisterPasswordForm extends StatelessWidget {
  /// Creates a [RegisterPasswordForm] widget.
  const RegisterPasswordForm({super.key});

  /// Builds the widget tree for the password form.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Column] widget containing the password form.
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PasswordController>();
    final registerController = Get.find<RegisterRequestController>();
    final width = context.w;
    final isLandscape = width > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Displays the password title text.
        Text(
          textAlign: TextAlign.start,
          context.translate.password_title,
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: isLandscape ? 8.sp : null),
        ),
        addVerticalSpace(8),
        Obx(() {
          final hide = controller.obsecurText;
          final tooltip = controller.showTooltip;

          /// A text form field for entering the password.
          return TextFormField(
            controller: registerController.passwordController,
            onChanged: (password) {
              controller.validatePassword(password);
              controller.showPasswordToolTip();
              registerController.passwordRequired.value = false;
            },
            onTap: () => controller.showPasswordToolTip(),
            onTapOutside: (event) {
              controller.resetPasswordTextForm();
              FocusScope.of(context).unfocus();
            },
            focusNode: registerController.passwordFocus,
            cursorColor: neutral100,
            maxLines: 1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: hide,
            decoration: InputDecoration(
              prefixIcon: tooltip
                  ? (isLandscape
                      ? const LPasswordTooltip().animate().fadeIn()
                      : const PasswordTooltip().animate().fadeIn())
                  : const Icon(
                      SolarIconsBold.lockKeyholeMinimalistic,
                      color: neutral100,
                    ),
              suffixIcon: const SuffixPassword(),
              hintText: context.translate.password_hint,
              hintStyle: isLandscape
                  ? context.appTheme.inputDecorationTheme.hintStyle!
                      .copyWith(fontSize: 8.sp)
                  : null,
              errorText: registerController.passwordRequired.value
                  ? context.translate.text_form_required
                  : null,
            ),
          );
        }),
      ],
    );
  }
}
