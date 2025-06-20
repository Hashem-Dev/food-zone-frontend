import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/data/repositories/register.dart';

/// A stateless widget that represents the user name form in the registration process.
class RegisterUserNameForm extends StatelessWidget {
  /// Creates a [RegisterUserNameForm] widget.
  const RegisterUserNameForm({super.key});

  /// Builds the widget tree for the user name form.
  ///
  /// This method is called when the widget is built. It retrieves the
  /// [RegisterRequestController] using Get.find and constructs a column
  /// containing a title text and a [TextFormField] for the user name input.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the user name form.
  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterRequestController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.start,
          context.translate.user_name_title,
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: !context.isPhone ? 8.sp : null,
          ),
        ),
        addVerticalSpace(8),
        Obx(
          () => TextFormField(
            controller: registerController.userNameController,
            focusNode: registerController.userNameFocus,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            onChanged: (username) =>
                registerController.userNameRequired.value = false,
            cursorHeight: 20.h,
            cursorColor: neutral100,
            maxLines: 1,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: const Icon(SolarIconsBold.user, color: neutral100),
              hintText: context.translate.hint_user_name,
              hintStyle:
                  context.appTheme.inputDecorationTheme.hintStyle!.copyWith(
                fontSize: !context.isPhone ? 8.sp : null,
              ),
              errorText: registerController.userNameRequired.value
                  ? context.translate.text_form_required
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
