import 'package:food_zone/exports.dart';

/// Controller for managing the login password functionality.
class LoginPasswordController extends GetxController {
  /// Controller for the password text field.
  TextEditingController passwordEditingController = TextEditingController();

  /// Observable boolean to toggle password visibility.
  final RxBool _hidden = true.obs;

  /// Key for the login tooltip.
  final _tooltipKeyLogin = GlobalKey<TooltipState>();

  /// Observable boolean to validate password length.
  final RxBool isLengthValid = false.obs;

  /// Observable boolean to validate the presence of an uppercase letter.
  final RxBool isUpperCaseValid = false.obs;

  /// Observable boolean to validate the presence of a number.
  final RxBool isNumberValid = false.obs;

  /// Observable boolean to validate the presence of a special character.
  final RxBool isSpecialCharValid = false.obs;

  /// Observable boolean to validate the password.
  final RxBool isPasswordValid = false.obs;

  /// Observable list to store the results of the password validation checks.
  final RxList<bool> _validationResult =
      [false, false, false, false, false].obs;

  /// Observable boolean to control the visibility of the tooltip.
  final RxBool _showTooltip = false.obs;

  /// Checks if the password contains repeated characters.
  ///
  /// @param password The password string to check.
  /// @returns A boolean indicating if the password has repeated characters.
  bool _hasRepeatedChars(String password) {
    bool hasRepeatedChar = true;
    if (password.isEmpty) {
      return hasRepeatedChar;
    }

    List split = password.split('');

    Map<String, int> frequency = {};

    for (var item in split) {
      if (frequency.containsKey(item)) {
        frequency[item] = frequency[item]! + 1;
      } else {
        frequency[item] = 1;
      }
    }
    frequency.forEach((key, value) {
      if (value > 1) {
        hasRepeatedChar = false;
      }
    });

    return hasRepeatedChar;
  }

  /// Validates the password based on length, uppercase, number, special character, and repeated characters.
  ///
  /// @param password The password string to validate.
  void validatePassword(String password) {
    _validationResult.value = [];
    isLengthValid.value = password.length >= 8 && password.length <= 32;
    isUpperCaseValid.value = password.contains(RegExp(r'[A-Z]'));
    isNumberValid.value = password.contains(RegExp(r'[0-9]'));
    isSpecialCharValid.value =
        password.contains(RegExp(r'[@#$%^&*(),.?":{}|<>]'));
    isPasswordValid.value = _hasRepeatedChars(password);

    _validationResult.addAll([
      isLengthValid.value,
      isUpperCaseValid.value,
      isNumberValid.value,
      isSpecialCharValid.value,
      isPasswordValid.value
    ]);
  }

  /// Toggles the visibility of the password.
  void viewPassword() {
    _hidden.value = !_hidden.value;
  }

  /// Shows the tooltip for password validation.
  void showPasswordToolTip() {
    final validate = validationResult.indexOf(false);
    if (validate == -1) {
      _showTooltip.value = false;
    } else if (validate >= 0) {
      _showTooltip.value = true;
      _tooltipKeyLogin.currentState?.ensureTooltipVisible();
    }
  }

  /// Resets the password text form and hides the tooltip if the password is empty.
  void resetPasswordTextForm() {
    final String password = passwordEditingController.text;
    if (!password.isNotEmpty) {
      _showTooltip.value = false;
    }
  }

  /// Gets the validation results.
  ///
  /// @returns A list of booleans representing the validation results.
  List get validationResult => _validationResult;

  /// Gets the current state of password visibility.
  ///
  /// @returns A boolean indicating if the password is hidden.
  bool get obSecureText => _hidden.value;

  /// Gets the key for the login tooltip.
  ///
  /// @returns The GlobalKey for the login tooltip.
  GlobalKey<TooltipState> get tooltipKeyLogin => _tooltipKeyLogin;

  /// Gets the current state of tooltip visibility.
  ///
  /// @returns A boolean indicating if the tooltip is visible.
  bool get showTooltip => _showTooltip.value;

  /// Disposes the password editing controller when the controller is closed.
  @override
  void onClose() {
    passwordEditingController.dispose();
    super.onClose();
  }
}
