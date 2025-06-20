import 'package:food_zone/main.dart';
import 'package:get/get.dart';

/// Controller for managing the "Remember Me" state in the login feature.
///
/// This controller handles the state of the "Remember Me" checkbox, allowing
/// users to choose whether they want the application to remember their login
/// credentials for future sessions.
class RememberMeController extends GetxController {
  /// Observable boolean that holds the state of the "Remember Me" checkbox.
  ///
  /// This value is initialized from the stored preferences.
  final RxBool _rememberMe = prefs.rememberUser.obs;

  /// Toggles the state of the "Remember Me" checkbox.
  ///
  /// This function changes the current state of the checkbox and updates the
  /// stored preferences accordingly.
  void changeRememberMeState() {
    _rememberMe.value = !_rememberMe.value;
    prefs.rememberMe(_rememberMe.value);
  }

  /// Gets the current state of the "Remember Me" checkbox.
  ///
  /// @returns A boolean indicating whether the "Remember Me" checkbox is checked.
  bool get rememberMe => _rememberMe.value;
}
