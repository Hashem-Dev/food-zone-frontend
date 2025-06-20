import 'package:food_zone/core/global_widgets/auth_text_switch.dart';
import 'package:food_zone/core/global_widgets/or_with.dart';
import 'package:food_zone/core/global_widgets/social_authentication.dart';
import 'package:food_zone/core/utils/navigation.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/data/repositories/login.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_email_form_login.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_forgot_password.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_password_form.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_remember_me.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_subtitle.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/p_title.dart';
import 'package:food_zone/features/auth/register/presentation/pages/register.dart';

/// A stateless widget that represents the portrait layout of the login page.
///
/// This widget includes various components such as title, subtitle, email form,
/// password form, remember me checkbox, forgot password button, login button,
/// social authentication options, and a switch to the registration page.
///
/// {@tool snippet}
/// This example shows how to use the [PortraitLogin] widget in a Flutter application:
///
/// ```dart
/// PortraitLogin();
/// ```
/// {@end-tool}
class PortraitLogin extends StatelessWidget {
  /// Creates a [PortraitLogin] widget.
  const PortraitLogin({super.key});

  /// Builds the widget tree for the portrait login page.
  ///
  /// This method is called when the widget is built. It initializes the
  /// [LoginController] and constructs the UI components in a column layout.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the portrait login page.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoginTitle(),
          addVerticalSpace(8),
          const LoginSubtitle(),
          addVerticalSpace(32),
          const LoginEmailForm(),
          addVerticalSpace(14),
          const LoginPasswordForm(),
          addVerticalSpace(14),
          const Row(
            children: [
              Expanded(child: RememberMe()),
              ForgotPasswordButton(),
            ],
          ),
          addVerticalSpace(114),
          FButton(
            size: true,
            title: context.translate.login,
            onPressed: () => loginController.login(context),
          ),
          addVerticalSpace(28),
          OrWithWidget(title: context.translate.register_with),
          addVerticalSpace(25),
          const SocialAuthentication(),
          addVerticalSpace(37),
          AuthTextSwitch(
            text: context.translate.not_have_account,
            textBtn: context.translate.register,
            onTap: () => getView(const RegisterView()),
          ),
        ],
      ),
    );
  }
}
