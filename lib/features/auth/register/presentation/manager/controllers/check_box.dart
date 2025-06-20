import 'package:get/get.dart';

/// Controller for managing the state of an agreement checkbox.
///
/// This controller uses GetX to manage the state of a checkbox that users
/// need to agree to during the registration process.
class AgreeCheckBoxController extends GetxController {
  /// Observable boolean that holds the checked state of the checkbox.
  final RxBool _checked = false.obs;

  /// Toggles the checked state of the checkbox.
  ///
  /// This function is called when the user interacts with the checkbox
  /// to change its state. It switches the value of `_checked` between
  /// `true` and `false`.
  void changeCheckState() {
    _checked.value = !_checked.value;
  }

  /// Returns the current checked state of the checkbox.
  ///
  /// @returns `true` if the checkbox is checked, `false` otherwise.
  bool get isChecked => _checked.value;
}
