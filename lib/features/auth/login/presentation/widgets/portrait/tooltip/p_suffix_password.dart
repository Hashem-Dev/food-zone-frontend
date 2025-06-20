import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';

/// A widget that provides a suffix icon for the password field in the login form.
///
/// This widget is used to toggle the visibility of the password text.
/// It listens to the [LoginPasswordController] to determine whether the password
/// is currently visible or hidden, and updates the icon accordingly.
class SuffixPasswordLogin extends StatelessWidget {
  /// Creates a [SuffixPasswordLogin] widget.
  const SuffixPasswordLogin({super.key});

  /// Builds the [SuffixPasswordLogin] widget.
  ///
  /// This method uses the [Get put] method to retrieve the [LoginPasswordController]
  /// and listens to the [obSecureText] observable to update the icon.
  ///
  /// @param context The build context.
  /// @returns A widget that displays an icon which toggles the password visibility.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginPasswordController());
    return Obx(() {
      final hide = controller.obSecureText;
      return GestureDetector(
        onTap: () => controller.viewPassword(),
        child: Icon(
          hide ? SolarIconsOutline.eye : SolarIconsBold.eyeClosed,
          color: neutral100,
        ),
      );
    });
  }
}
