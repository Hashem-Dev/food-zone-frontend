import 'package:food_zone/core/global_widgets/auth_text_switch.dart';
import 'package:food_zone/core/global_widgets/or_with.dart';
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

/// A stateless widget that represents the landscape view of the registration page.
class LandscapeRegisterView extends StatelessWidget {
  /// Creates a [LandscapeRegisterView] widget.
  const LandscapeRegisterView({super.key});

  /// Builds the landscape registration view.
  ///
  /// This method constructs the UI for the landscape registration page, including
  /// the registration form, social media login options, and the register button.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the landscape registration view.
  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterRequestController>();
    final agreeController = Get.find<AgreeCheckBoxController>();
    return Obx(
      () => registerController.isLoading
          ? const Loading()
          : Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: context.heightByValue(14),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const RegisterTitle(),
                              addVerticalSpace(4),
                              const RegisterSupTitle(),
                              const RegisterEmailForm(),
                              const RegisterUserNameForm(),
                              const RegisterPasswordForm(),
                              const TermsOfServicesWidget(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AuthTextSwitch(
                              text: context.translate.already_have_account,
                              textBtn: context.translate.login,
                              onTap: () {
                                Get.to(() => const LoginView());
                              },
                            ),
                            addVerticalSpace(32),
                            OrWithWidget(
                              title: context.translate.register_with,
                            ),
                            addVerticalSpace(32),
                            const RegisterSocialIcons(),
                            addVerticalSpace(32),
                            Obx(() {
                              return FButton(
                                size: true,
                                title: context.translate.register_btn,
                                onPressed: agreeController.isChecked
                                    ? () => registerController.register(context)
                                    : null,
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
