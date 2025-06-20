import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/landscape/l_reset_password.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/portrait/p_reset_password.dart';

/// A stateless widget that represents the Reset Password view.
///
/// This view is responsible for displaying the reset password screen
/// with a responsive layout that adapts to both portrait and landscape
/// orientations.
///
/// The view contains an app bar with a gradient title and a body that
/// displays the appropriate layout based on the device orientation.
class ResetPasswordView extends StatelessWidget {
  /// Creates a [ResetPasswordView] widget.
  ///
  /// The [key] parameter is optional and can be used to uniquely identify
  /// this widget in the widget tree.
  const ResetPasswordView({super.key});

  /// Builds the widget tree for the Reset Password view.
  ///
  /// This method is called by the Flutter framework to build the widget tree.
  /// It returns a [Scaffold] widget that contains an app bar and a body with
  /// a responsive layout.
  ///
  /// @param context The build context for this widget.
  /// @returns A [Widget] representing the Reset Password view.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: GradientAppbarTitle(title: context.translate.new_password),
      ),
      body: const ResponsiveLayout(
        portrait: PortraitResetPassword(),
        landscape: LandscapeResetPassword(),
      ),
    );
  }
}
