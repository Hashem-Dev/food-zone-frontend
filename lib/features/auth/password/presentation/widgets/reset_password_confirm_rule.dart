import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';

/// A widget that displays a confirmation rule for password reset.
///
/// This widget shows an icon and a text indicating whether the passwords match.
/// It uses the `ResetPasswordController` to get the password match status.
class ResetPasswordConfirmRule extends StatelessWidget {
  /// Creates a [ResetPasswordConfirmRule] widget.
  const ResetPasswordConfirmRule({super.key});

  /// Builds the widget.
  ///
  /// @param context The build context.
  /// @returns A widget tree containing the confirmation rule.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    final width = context.w;
    final isLandscape = width > 600;
    return Obx(
      () => Row(
        children: [
          controller.isPasswordMatch
              ? Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: green500, shape: BoxShape.circle),
                  child: const Icon(SolarIconsOutline.unread,
                      size: 14, color: primaryWhite),
                ).animate().fadeIn(duration: const Duration(milliseconds: 600))
              : const Icon(SolarIconsOutline.infoCircle, size: 14),
          addHorizontalSpace(isLandscape ? 2 : 5),
          Text(
            context.translate.both_password_match,
            style: context.textStyle.titleSmall!.copyWith(
                color: controller.isPasswordMatch ? green500 : null,
                fontSize: isLandscape ? 6.sp : 8.sp),
          ),
        ],
      ),
    );
  }
}
