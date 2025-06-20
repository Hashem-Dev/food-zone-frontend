import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_confirm_rule.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_confirm_text_field.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_rules.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_subtitle.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_text_field.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_title.dart';

/// A stateless widget that represents the landscape layout for the reset password screen.
///
/// This widget is responsible for displaying the reset password form in landscape mode.
/// It uses various sub-widgets to build the form, including text fields, rules, and buttons.
class LandscapeResetPassword extends StatelessWidget {
  /// Creates a [LandscapeResetPassword] widget.
  const LandscapeResetPassword({super.key});

  /// Builds the landscape reset password widget.
  ///
  /// This method uses the [Get.put] method to initialize the [ResetPasswordController].
  /// It then uses an [Obx] widget to reactively update the UI based on the controller's state.
  /// If the controller is loading, it shows a loading indicator. Otherwise, it displays the reset password form.
  ///
  /// @param context The build context.
  /// @returns A widget tree representing the landscape reset password screen.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    return Obx(
      () => controller.loading
          ? const Loading()
          : Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ResetPasswordTitle(),
                    addVerticalSpace(8),
                    const ResetPasswordSubtitle(),
                    addVerticalSpace(8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const ResetPasswordTextField(),
                              addVerticalSpace(5),
                              const ResetPasswordRules(),
                              addVerticalSpace(10),
                              const ResetPasswordConfirmTextField(),
                              addVerticalSpace(5),
                              const ResetPasswordConfirmRule(),
                            ],
                          ),
                        ),
                        addHorizontalSpace(15),
                        SizedBox(
                          width: 325,
                          child: FButton(
                            title: context.translate.bottom_sheet_btn_name,
                            onPressed: () => controller.updatePassword(context),
                          ),
                        )
                      ],
                    ),
                    addVerticalSpace(16),
                  ],
                ),
              ),
            ),
    );
  }
}
