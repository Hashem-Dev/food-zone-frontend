import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/data/repositories/login.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/landscape/tooltip/l_password_tooltip.dart';

import 'tooltip/p_password_tooltip.dart';
import 'tooltip/p_suffix_password.dart';

/// A stateless widget that represents the login password form.
///
/// This widget includes a text field for the user to input their password,
/// with additional functionality such as password validation, tooltip display,
/// and dynamic styling based on the screen orientation.
class LoginPasswordForm extends StatelessWidget {
  /// Creates a [LoginPasswordForm] widget.
  const LoginPasswordForm({super.key});

  /// Builds the widget tree for the login password form.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the login password form.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginPasswordController());
    final loginController = Get.put(LoginController());
    final width = context.w;
    final isLandscape = width > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          context.translate.password_title,
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: isLandscape ? 8.sp : null),
        ),
        addVerticalSpace(8),
        Obx(() {
          final hide = controller.obSecureText;
          final tooltip = controller.showTooltip;
          return TextFormField(
            controller: loginController.passwordController,

            /// Called when the password input changes.
            ///
            /// @param password The new password input by the user.
            onChanged: (password) {
              controller.validatePassword(password);
              controller.showPasswordToolTip();
              loginController.passwordRequired.value = false;
            },

            /// Called when the password input field is tapped.
            onTap: () => controller.showPasswordToolTip(),

            /// Called when a tap outside the password input field occurs.
            ///
            /// @param event The tap event.
            onTapOutside: (event) {
              controller.resetPasswordTextForm();
              FocusScope.of(context).unfocus();
            },
            focusNode: loginController.passwordFocus,
            cursorColor: neutral100,
            maxLines: 1,
            keyboardType: TextInputType.visiblePassword,
            obscureText: hide,
            decoration: InputDecoration(
              prefixIcon: tooltip
                  ? (isLandscape
                      ? const LPasswordTooltipLogin().animate().fadeIn()
                      : const PPasswordTooltipLogin().animate().fadeIn())
                  : const Icon(
                      SolarIconsBold.lockKeyholeMinimalistic,
                      color: neutral100,
                    ),
              suffixIcon: const SuffixPasswordLogin(),
              hintText: context.translate.password_hint,
              hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
                  .copyWith(fontSize: isLandscape ? 9.sp : null),
              errorText: loginController.passwordRequired.value
                  ? context.translate.text_form_required
                  : null,
            ),
          );
        }),
      ],
    );
  }
}
