import 'package:food_zone/core/global_widgets/auth_text_switch.dart';
import 'package:food_zone/core/global_widgets/or_with.dart';
import 'package:food_zone/core/utils/navigation.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';
import 'package:food_zone/features/auth/register/data/repositories/register.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/check_box.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/email_form.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/password_form.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/social_icons.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/sub_title.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/terms_of_services/terms_of_services.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/title.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/user_name_form.dart';

/// A stateless widget that represents the portrait view of the registration page.
///
/// This widget builds the registration form with various input fields and buttons.
/// It uses the `Get` package for state management and navigation.
///
/// {@tool snippet}
/// This example shows how to use the `PortraitRegisterView` widget:
///
/// ```dart
/// PortraitRegisterView()
/// ```
/// {@end-tool}
class PortraitRegisterView extends StatelessWidget {
  /// Creates a new instance of `PortraitRegisterView`.
  const PortraitRegisterView({super.key});

  /// Builds the widget tree for the registration page.
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree representing the registration page.
  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterRequestController>();
    final agreeController = Get.find<AgreeCheckBoxController>();
    return Obx(
      () => registerController.isLoading
          ? const Loading()
          : SingleChildScrollView(
              child: Column(
                spacing: context.heightByValue(14),
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RegisterTitle(),
                  const RegisterSupTitle(),
                  const RegisterEmailForm(),
                  const RegisterUserNameForm(),
                  const RegisterPasswordForm(),
                  const TermsOfServicesWidget(),
                  addVerticalSpace(46),
                  Obx(
                    () => FButton(
                      size: true,
                      title: context.translate.register_btn,
                      onPressed: agreeController.isChecked
                          ? () => registerController.register(context)
                          : null,
                    ),
                  ),
                  // addVerticalSpace(32),
                  OrWithWidget(title: context.translate.register_with),
                  addVerticalSpace(12),
                  const RegisterSocialIcons(),
                  addVerticalSpace(10),
                  AuthTextSwitch(
                    text: context.translate.already_have_account,
                    textBtn: context.translate.login,
                    onTap: () => getView(const LoginView()),
                  ),
                  addVerticalSpace(5),
                ],
              ),
            ),
    );
  }
}
