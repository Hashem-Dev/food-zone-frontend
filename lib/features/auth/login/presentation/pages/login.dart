import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/data/repositories/login.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/login/presentation/pages/portrait_login.dart';
import 'landscape_login.dart';

/// A stateless widget that represents the login view.
///
/// This widget is responsible for displaying the login screen, which includes
/// a responsive layout that adapts to portrait and landscape orientations.
/// It uses the GetX package for state management and dependency injection.
class LoginView extends StatelessWidget {
  /// Creates a [LoginView] widget.
  const LoginView({super.key});

  /// Builds the login view widget.
  ///
  /// This method initializes the [LoginPasswordController] and [LoginController]
  /// using GetX's dependency injection. It then returns a [Scaffold] widget
  /// with an [AppBar] and a body that displays either a loading indicator or
  /// the responsive layout based on the [LoginController]'s loading state.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the login view.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginPasswordController(), permanent: true);
    final loginController = Get.put(LoginController(), permanent: true);
    loginController.setEmail();
    return Scaffold(
      key: GlobalKey(),
      appBar: AppBar(actions: const [GuestLogin()]),
      body: Obx(
        () {
          return loginController.loading
              ? const Loading()
              : const ResponsiveLayout(
                  portrait: PortraitLogin(),
                  landscape: LandscapeLogin(),
                );
        },
      ),
    );
  }
}
