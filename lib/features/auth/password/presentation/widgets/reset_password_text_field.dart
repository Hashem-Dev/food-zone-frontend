import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';

/// A widget that provides a text field for resetting the password.
///
/// This widget is used in the password reset feature of the application.
/// It includes a text field for entering a new password and handles various
/// password validation checks.
class ResetPasswordTextField extends StatelessWidget {
  /// Creates a [ResetPasswordTextField] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget
  /// in the widget tree.
  const ResetPasswordTextField({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for managing the state of the reset password process.
    final controller = Get.put(ResetPasswordController());
    // Width of the current context.
    final width = context.w;
    // Determines if the current orientation is landscape.
    final isLandscape = width > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Text widget displaying the label for the new password field.
        Text(
          context.translate.new_password,
          style: context.textStyle.titleMedium!.copyWith(
              fontWeight: FontWeight.w500, fontSize: isLandscape ? 8.sp : null),
        ),
        addVerticalSpace(8),
        // Observer widget that rebuilds when the observed variables change.
        Obx(
          () => TextFormField(
            // Unfocuses the text field when tapped outside.
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            // Controller for the new password text field.
            controller: controller.newPasswordController,
            // Focus node for the new password text field.
            focusNode: controller.newPasswordFocusNode,
            // Sets the keyboard type to visible password.
            keyboardType: TextInputType.visiblePassword,
            // Obscures the text based on the controller's state.
            obscureText: controller.newPasswordIsHidden,
            // Callback for when the text in the field changes.
            onChanged: (newPassword) {
              controller.checkPasswordLength();
              controller.checkPasswordComplexity();
              controller.checkPasswordRepeated();
              controller.checkPasswordMatching();
            },
            // Sets the cursor color.
            cursorColor: neutral100,
            // Decoration for the text field.
            decoration: InputDecoration(
              // Hint text for the text field.
              hintText: context.translate.new_password,
              // Color for the suffix icon.
              suffixIconColor: neutral100,
              // Suffix icon for toggling password visibility.
              suffixIcon: GestureDetector(
                onTap: () => controller.newPasswordObscureText(),
                child: controller.newPasswordIsHidden
                    ? const Icon(SolarIconsOutline.eye)
                    : const Icon(SolarIconsOutline.eyeClosed),
              ),
              // Error text displayed when there is a password error.
              errorText: controller.passwordError
                  ? context.translate.text_form_required
                  : null,
              // Style for the hint text.
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
