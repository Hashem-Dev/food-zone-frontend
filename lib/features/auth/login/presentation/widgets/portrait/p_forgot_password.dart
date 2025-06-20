import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/password_bottom_sheet/password_bottom_sheet.dart';

/// A stateless widget that represents a button for the "Forgot Password" functionality.
///
/// When tapped, it shows a bottom sheet for password recovery.
///
/// This widget adapts its font size based on the screen orientation.
class ForgotPasswordButton extends StatelessWidget {
  /// Creates a [ForgotPasswordButton] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget in the widget tree.
  const ForgotPasswordButton({super.key});

  /// Builds the widget tree for the [ForgotPasswordButton].
  ///
  /// This method is called whenever the widget needs to be rendered.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [GestureDetector] widget that wraps a [Text] widget.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPasswordBottomSheet(context),
      child: Text(
        context.translate.forgot_password,
        style: context.textStyle.headlineSmall!.copyWith(
            color: primary500, fontSize: context.isLandscape ? 8.sp : null),
      ),
    );
  }
}
