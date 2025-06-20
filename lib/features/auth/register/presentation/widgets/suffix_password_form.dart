import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';

/// A widget that displays an icon to toggle the visibility of a password field.
///
/// The [SuffixPassword] widget uses a [PasswordController] to manage the state
/// of the password visibility. When the icon is tapped, the password visibility
/// is toggled between hidden and visible.
///
/// Example usage:
/// ```dart
/// SuffixPassword()
/// ```
class SuffixPassword extends StatelessWidget {
  /// Creates a [SuffixPassword] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget
  /// in the widget tree.
  const SuffixPassword({super.key});

  /// Builds the [SuffixPassword] widget.
  ///
  /// The [build] method creates a [GestureDetector] that toggles the password
  /// visibility when tapped. The icon displayed depends on the current state
  /// of the password visibility, which is managed by the [PasswordController].
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree containing the [GestureDetector] and [Icon].
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());
    return Obx(() {
      final hide = controller.obsecurText;
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
