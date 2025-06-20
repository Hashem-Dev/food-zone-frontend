import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_confirm_rule.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_confirm_text_field.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_rules.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_subtitle.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_text_field.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/reset_password_title.dart';

/// A stateless widget that represents the portrait layout for the reset password screen.
///
/// This widget uses the `ResetPasswordController` to manage the state of the reset password process.
/// It displays a loading indicator while the password is being reset and shows the reset password form when not loading.
class PortraitResetPassword extends StatelessWidget {
  /// Creates a new instance of [PortraitResetPassword].
  const PortraitResetPassword({super.key});

  /// Builds the widget tree for the portrait reset password screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree representing the portrait reset password screen.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());

    return Obx(
      () => controller.loading
          ? const Loading()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ResetPasswordTitle(),
                        addVerticalSpace(8),
                        const ResetPasswordSubtitle(),
                        addVerticalSpace(20),
                        const ResetPasswordTextField(),
                        addVerticalSpace(10),
                        const ResetPasswordRules(),
                        addVerticalSpace(30),
                        const ResetPasswordConfirmTextField(),
                        addVerticalSpace(10),
                        const ResetPasswordConfirmRule(),
                      ],
                    ),
                  ),
                ),
                BottomAppBar(
                  elevation: 0,
                  color: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 16.0.h),
                  child: FButton(
                      size: true,
                      title: context.translate.bottom_sheet_btn_name,
                      onPressed: () {
                        controller.updatePassword(context);
                      }),
                ),
              ],
            ),
    );
  }
}
