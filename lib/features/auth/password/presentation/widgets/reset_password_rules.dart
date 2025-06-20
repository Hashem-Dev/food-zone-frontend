import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';

/// A widget that displays the rules for resetting a password.
///
/// This widget shows a list of password rules and indicates whether each rule
/// is satisfied or not. It uses the `ResetPasswordController` to get the
/// validation results for each rule.
class ResetPasswordRules extends StatelessWidget {
  /// Creates a new instance of [ResetPasswordRules].
  const ResetPasswordRules({super.key});

  /// Builds the widget tree for the password rules.
  ///
  /// @param context The build context.
  /// @returns A widget tree displaying the password rules.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    final List<String> passwordRuleText = [
      context.translate.password_rules_length,
      context.translate.password_rules_complexity,
      context.translate.password_rules_avoid_repetitions,
    ];
    final width = context.w;
    final isLandscape = width > 600;
    return Obx(
      () => Column(
        children: List.generate(
          3,
          (index) {
            final isValid = controller.validationResult[index];
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Row(
                children: [
                  isValid
                      ? Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: green500, shape: BoxShape.circle),
                          child: const Icon(SolarIconsOutline.unread,
                              size: 14, color: primaryWhite),
                        )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 600))
                      : const Icon(SolarIconsOutline.infoCircle, size: 14),
                  addHorizontalSpace(isLandscape ? 2 : 5),
                  Text(
                    passwordRuleText[index],
                    style: context.textStyle.titleSmall!.copyWith(
                        color: isValid ? green500 : null,
                        fontSize: isLandscape ? 6.sp : 8.sp),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
