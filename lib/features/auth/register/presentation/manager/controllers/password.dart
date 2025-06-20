import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Controller for managing password-related logic and state.
class PasswordController extends GetxController {
  /// Controller for the password text field.
  TextEditingController passwordEditingController = TextEditingController();

  /// Observable boolean indicating whether the password is hidden.
  final RxBool _hidden = true.obs;

  /// Key for the tooltip widget.
  final _tooltipKey = GlobalKey<TooltipState>();

  /// Observable boolean indicating if the password length is valid.
  final RxBool isLengthValid = false.obs;

  /// Observable boolean indicating if the password contains an uppercase letter.
  final RxBool isUpperCaseValid = false.obs;

  /// Observable boolean indicating if the password contains a number.
  final RxBool isNumberValid = false.obs;

  /// Observable boolean indicating if the password contains a special character.
  final RxBool isSpecialCharValid = false.obs;

  /// Observable boolean indicating if the password is valid.
  final RxBool isPasswordValid = false.obs;

  /// Observable list of booleans representing the validation results.
  final RxList<bool> _validationResult =
      [false, false, false, false, false].obs;

  /// Observable boolean indicating whether to show the tooltip.
  final RxBool _showTooltip = false.obs;

  /// Checks if the password has repeated characters.
  ///
  /// @param password The password to check.
  /// @returns `true` if the password has repeated characters, `false` otherwise.
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

  /// Validates the password based on various criteria.
  ///
  /// @param password The password to validate.
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

  /// Shows the password tooltip if validation fails.
  void showPasswordToolTip() {
    final validate = validationResult.indexOf(false);
    if (validate == -1) {
      _showTooltip.value = false;
    } else if (validate >= 0) {
      _showTooltip.value = true;
      _tooltipKey.currentState?.ensureTooltipVisible();
    }
  }

  /// Resets the password text form and hides the tooltip if the password is empty.
  void resetPasswordTextForm() {
    final String password = passwordEditingController.text;
    if (!password.isNotEmpty) {
      _showTooltip.value = false;
    }
  }

  /// Gets the validation result list.
  ///
  /// @returns A list of booleans representing the validation results.
  List get validationResult => _validationResult;

  /// Gets the boolean indicating whether the password is hidden.
  ///
  /// @returns `true` if the password is hidden, `false` otherwise.
  bool get obsecurText => _hidden.value;

  /// Gets the tooltip key.
  ///
  /// @returns The key for the tooltip widget.
  GlobalKey<TooltipState> get tooltipKey => _tooltipKey;

  /// Gets the boolean indicating whether to show the tooltip.
  ///
  /// @returns `true` if the tooltip should be shown, `false` otherwise.
  bool get showTooltip => _showTooltip.value;

  /// Disposes the password editing controller when the controller is closed.
  @override
  void onClose() {
    passwordEditingController.dispose();
    super.onClose();
  }
}
