import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';

/// A widget that provides a text field for confirming the password during the reset password process.
///
/// This widget uses the `ResetPasswordController` to manage the state of the text field and handle
/// password matching logic. It also adapts its layout based on the screen orientation.
class ResetPasswordConfirmTextField extends StatelessWidget {
  /// Creates a [ResetPasswordConfirmTextField] widget.
  const ResetPasswordConfirmTextField({super.key});

  /// Builds the widget tree for the [ResetPasswordConfirmTextField].
  ///
  /// @param context The build context for the widget.
  /// @returns A [Column] widget containing a text label and a password confirmation text field.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResetPasswordController());
    final width = context.w;
    final isLandscape = width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.translate.confirm_password,
          style: context.textStyle.titleMedium!.copyWith(
              fontWeight: FontWeight.w500, fontSize: isLandscape ? 8.sp : null),
        ),
        addVerticalSpace(8),
        Obx(
          () => TextFormField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: controller.confirmPasswordController,
            focusNode: controller.confirmPasswordFocusNode,
            keyboardType: TextInputType.visiblePassword,
            obscureText: controller.confirmPasswordIsHidden,
            onChanged: (password) => controller.checkPasswordMatching(),
            cursorColor: neutral100,
            decoration: InputDecoration(
              hintText: context.translate.confirm_password,
              suffixIconColor: neutral100,
              suffixIcon: GestureDetector(
                onTap: () => controller.confirmPasswordObscureText(),
                child: controller.confirmPasswordIsHidden
                    ? const Icon(SolarIconsOutline.eye)
                    : const Icon(SolarIconsOutline.eyeClosed),
              ),
              errorText: controller.confirmError
                  ? context.translate.text_form_required
                  : null,
              hintStyle: context.borderStyle.hintStyle!.copyWith(
                fontSize: isLandscape ? 8.sp : null,
              ),
            ),
          ),
        )
      ],
    );
  }
}
