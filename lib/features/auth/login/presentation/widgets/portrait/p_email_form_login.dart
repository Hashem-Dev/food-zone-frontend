import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/data/repositories/login.dart';

/// A stateless widget that represents the email form for login.
///
/// This widget contains a text field for the user to input their email address.
/// It uses the `LoginController` to manage the state of the email input.
///
/// Example usage:
/// ```dart
/// LoginEmailForm();
/// ```
class LoginEmailForm extends StatelessWidget {
  /// Creates a [LoginEmailForm] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget in the widget tree.
  const LoginEmailForm({super.key});

  /// Builds the widget tree for the [LoginEmailForm].
  ///
  /// This method is called by the Flutter framework to build the widget tree.
  /// It initializes the `LoginController` and sets up the email input field.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Column] widget containing the email input field and related UI elements.
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());

    final width = context.w;
    final isLandscape = width > 600;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          context.translate.email_title,
          style: context.textStyle.displaySmall!
              .copyWith(fontSize: isLandscape ? 8.sp : null),
        ),
        addVerticalSpace(8),
        Obx(
          () => TextFormField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            controller: loginController.emailController,
            keyboardType: TextInputType.emailAddress,
            onChanged: (email) {
              loginController.emailRequired.value = false;
            },
            cursorColor: neutral100,
            maxLines: 1,
            decoration: InputDecoration(
                prefixIcon:
                    const Icon(SolarIconsBold.letter, color: neutral100),
                hintText: context.translate.hint_email,
                hintStyle: context.appTheme.inputDecorationTheme.hintStyle!
                    .copyWith(fontSize: isLandscape ? 8.sp : null),
                errorText: loginController.emailRequired.value
                    ? context.translate.text_form_required
                    : null),
          ),
        ),
      ],
    );
  }
}
