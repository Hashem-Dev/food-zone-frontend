import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/data/repositories/register.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/check_box.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/pages/landscape_register.dart';
import 'package:food_zone/features/auth/register/presentation/pages/portrait_register.dart';

/// A stateless widget that represents the registration view.
///
/// This widget is responsible for displaying the registration screen
/// and managing the state of the registration process.
/// It uses the `Get` package for state management and dependency injection.
class RegisterView extends StatelessWidget {
  /// Creates a new instance of [RegisterView].
  const RegisterView({super.key});

  /// Builds the widget tree for the registration view.
  ///
  /// This method initializes the necessary controllers and returns a [Scaffold]
  /// widget that contains an [AppBar] and a body that displays either a loading
  /// indicator or the registration form based on the state of the `registerController`.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the registration view.
  @override
  Widget build(BuildContext context) {
    // Initialize the password and agree checkbox controllers.
    Get.put(PasswordController());
    Get.put(AgreeCheckBoxController());
    // Initialize the register request controller.
    final registerController = Get.put(RegisterRequestController());

    return Scaffold(
      appBar: AppBar(actions: const [GuestLogin()]),
      body: Obx(
        () => registerController.isLoading
            ? const Loading()
            : const ResponsiveLayout(
                portrait: PortraitRegisterView(),
                landscape: LandscapeRegisterView(),
              ),
      ),
    );
  }
}
