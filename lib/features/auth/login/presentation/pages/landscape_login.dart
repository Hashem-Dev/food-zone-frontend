import 'package:food_zone/core/global_widgets/auth_text_switch.dart';
import 'package:food_zone/core/global_widgets/or_with.dart';
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
import 'package:food_zone/features/auth/register/presentation/widgets/social_icons.dart';

/// A stateless widget that represents the landscape layout for the login screen.
///
/// This widget is used to display the login screen in landscape mode. It contains
/// two main sections: the login form and the social login options.
///
/// The login form includes fields for email and password, as well as options for
/// remembering the user and resetting the password. The social login options
/// include buttons for logging in with social media accounts.
///
/// The widget uses the `Get` package for state management and navigation.
///
/// Example usage:
/// ```dart
/// LandscapeLogin();
/// ```
class LandscapeLogin extends StatelessWidget {
  /// Creates a new instance of the [LandscapeLogin] widget.
  const LandscapeLogin({super.key});

  /// Builds the widget tree for the landscape login screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree representing the landscape login screen.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    return Center(
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LoginTitle(),
                    addVerticalSpace(8),
                    const LoginSubtitle(),
                    addVerticalSpace(15),
                    const LoginEmailForm(),
                    addVerticalSpace(15),
                    const LoginPasswordForm(),
                    addVerticalSpace(15),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RememberMe(),
                        ForgotPasswordButton(),
                      ],
                    ),
                    addVerticalSpace(15),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                height: context.h / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AuthTextSwitch(
                      text: context.translate.not_have_account,
                      textBtn: context.translate.register,
                      onTap: () => getView(const RegisterView()),
                    ),
                    OrWithWidget(title: context.translate.sign_in_with),
                    const RegisterSocialIcons(),
                    FButton(
                      size: true,
                      title: context.translate.login,
                      onPressed: () => loginController.login(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
