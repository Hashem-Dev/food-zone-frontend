import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/password/presentation/widgets/password_bottom_sheet/success_password_bottom_sheet.dart';
import 'package:http/http.dart' as http;

/// Controller for managing the reset password functionality.
class ResetPasswordController extends GetxController {
  /// Controller for the new password input field.
  final TextEditingController newPasswordController = TextEditingController();

  /// Controller for the confirm password input field.
  final TextEditingController confirmPasswordController =
      TextEditingController();

  /// Focus node for the new password input field.
  final FocusNode newPasswordFocusNode = FocusNode();

  /// Focus node for the confirm password input field.
  final FocusNode confirmPasswordFocusNode = FocusNode();

  /// Observable boolean indicating if there is an error with the new password.
  final RxBool _newPasswordError = false.obs;

  /// Observable boolean indicating if there is an error with the confirm password.
  final RxBool _confirmPasswordError = false.obs;

  /// Observable boolean indicating if the loading state is active.
  final RxBool _isLoading = false.obs;

  /// Observable string for the email form view.
  RxString emailFormEmailView = ''.obs;

  /// Sets the loading state.
  ///
  /// @param loading A boolean indicating if the loading state should be active.
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Gets the current loading state.
  ///
  /// @returns A boolean indicating if the loading state is active.
  bool get loading => _isLoading.value;

  /// List of observable booleans for password validation results.
  final List<RxBool> _validationResult = [
    false.obs,
    false.obs,
    true.obs,
  ];

  /// Observable boolean indicating if the new password is hidden.
  final RxBool _newPasswordIsHidden = true.obs;

  /// Toggles the visibility of the new password.
  void newPasswordObscureText() {
    _newPasswordIsHidden.value = !_newPasswordIsHidden.value;
  }

  /// Checks if the new password length is valid.
  void checkPasswordLength() {
    final String newPassword = newPasswordController.text;
    if (newPassword.length >= 8 && newPassword.length <= 32) {
      _validationResult[0].value = true;
      return;
    }
    _validationResult[0].value = false;
  }

  /// Checks if the new password meets complexity requirements.
  void checkPasswordComplexity() {
    final String password = newPasswordController.text;
    final bool isUberCase = password.contains(RegExp(r'[A-Z]'));
    final bool isContainNumber = password.contains(RegExp(r'[0-9]'));
    final bool isSpecialChar =
        password.contains(RegExp(r'[@#$%^&*(),.?":{}|<>]'));

    if (isUberCase && isContainNumber && isSpecialChar) {
      _validationResult[1].value = true;
      return;
    }
    _validationResult[1].value = false;
  }

  /// Checks if the new password contains repeated characters.
  void checkPasswordRepeated() {
    final String password = newPasswordController.text;

    if (password.isEmpty) {
      _validationResult[2].value = true;
      return;
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
        _validationResult[2].value = false;
      } else {
        _validationResult[2].value = true;
      }
    });
  }

  /// Gets the password validation results.
  ///
  /// @returns A list of booleans indicating the validation results.
  List<bool> get validationResult => [
        _validationResult[0].value,
        _validationResult[1].value,
        _validationResult[2].value,
      ];

  /// Gets the visibility state of the new password.
  ///
  /// @returns A boolean indicating if the new password is hidden.
  bool get newPasswordIsHidden => _newPasswordIsHidden.value;

  /// Gets the error state of the new password.
  ///
  /// @returns A boolean indicating if there is an error with the new password.
  bool get passwordError => _newPasswordError.value;

  /// Gets the error state of the confirm password.
  ///
  /// @returns A boolean indicating if there is an error with the confirm password.
  bool get confirmError => _confirmPasswordError.value;

  /// Observable boolean indicating if the confirm password is hidden.
  final RxBool _confirmPasswordIsHidden = true.obs;

  /// Observable boolean indicating if the passwords match.
  final RxBool _isPasswordMatch = true.obs;

  /// Toggles the visibility of the confirm password.
  void confirmPasswordObscureText() {
    _confirmPasswordIsHidden.value = !_confirmPasswordIsHidden.value;
  }

  /// Gets the visibility state of the confirm password.
  ///
  /// @returns A boolean indicating if the confirm password is hidden.
  bool get confirmPasswordIsHidden => _confirmPasswordIsHidden.value;

  /// Checks if the new password and confirm password match.
  void checkPasswordMatching() {
    final String newPassword = newPasswordController.text;
    final String confirmPassword = confirmPasswordController.text;
    if (newPassword != confirmPassword) {
      _isPasswordMatch.value = false;
      return;
    }
    _isPasswordMatch.value = true;
  }

  /// Gets the password match state.
  ///
  /// @returns A boolean indicating if the passwords match.
  bool get isPasswordMatch => _isPasswordMatch.value;

  /// Updates the password by making an HTTP PATCH request.
  ///
  /// @param context The BuildContext of the current widget.
  /// @returns A Future that completes when the password update is finished.
  Future updatePassword(BuildContext context) async {
    final bool isPasswordValid = validationResult.contains(false);
    final String newPassword = newPasswordController.text;
    if (isPasswordValid || newPassword.isEmpty) {
      _newPasswordError.value = true;
      newPasswordFocusNode.requestFocus();
      showErrorSnackBar(context.translate.password_not_follow_rules);
      return;
    }

    if (!isPasswordMatch) {
      _confirmPasswordError.value = true;
      confirmPasswordFocusNode.requestFocus();
      showErrorSnackBar(context.translate.password_not_match);
      return;
    }
    setLoading(true);
    final email = emailFormEmailView.value.isEmpty
        ? prefs.userEmail
        : emailFormEmailView.value;

    final data = {'email': email, 'newPassword': newPassword};
    final body = jsonEncode(data);
    final Uri url = Uri.parse('$baseUrl/users/reset-password');

    try {
      final http.Response response =
          await http.patch(url, headers: headers, body: body);

      final decodedBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        showSuccessSnackBar(decodedBody['message']);
        setLoading(false);
        if (context.mounted) {
          showSuccessUpdatedPassword(context);
        }
      } else {
        setLoading(false);
        showErrorSnackBar(decodedBody['message']);
        return;
      }
    } catch (error) {
      setLoading(false);
      rethrow;
    }
  }
}
