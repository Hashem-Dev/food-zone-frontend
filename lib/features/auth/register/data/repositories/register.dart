import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email_otp.dart';
import 'package:food_zone/features/auth/register/data/models/register_request.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';

import 'package:http/http.dart' as http;

/// Controller for handling user registration requests.
class RegisterRequestController extends GetxController {
  /// Controller for the username input field.
  final TextEditingController userNameController = TextEditingController();

  /// Controller for the email input field.
  final TextEditingController emailController = TextEditingController();

  /// Controller for the password input field.
  final TextEditingController passwordController = TextEditingController();

  /// Observable boolean indicating if the email field is required.
  final RxBool emailRequired = false.obs;

  /// Observable boolean indicating if the username field is required.
  final RxBool userNameRequired = false.obs;

  /// Observable boolean indicating if the password field is required.
  final RxBool passwordRequired = false.obs;

  /// Focus node for the username input field.
  final FocusNode userNameFocus = FocusNode();

  /// Focus node for the email input field.
  final FocusNode emailFocus = FocusNode();

  /// Focus node for the password input field.
  final FocusNode passwordFocus = FocusNode();

  /// Controller for password validation.
  final password = Get.find<PasswordController>();

  /// Controller for OTP verification.
  final verifyTypeController = Get.put(VerifyOtpController());

  /// Observable boolean indicating if a loading process is ongoing.
  final RxBool _isLoading = false.obs;

  /// Initiates the registration process.
  ///
  /// Validates the email, username, and password fields before creating a new user.
  /// @param context The build context.
  void register(BuildContext context) async {
    final bool isEmailValid = validateEmail(context);
    if (!isEmailValid) {
      return;
    }

    final bool isUserNameValid = validateUserName(context);
    if (!isUserNameValid) {
      return;
    }

    final bool isPasswordValid = validatePassword(context);
    if (!isPasswordValid) {
      return;
    }

    await createNewUser(context);
  }

  /// Creates a new user with the provided registration data.
  ///
  /// Sends a POST request to the server with the registration data.
  /// @param context The build context.
  Future<void> createNewUser(BuildContext context) async {
    setLoading(true);
    final username = userNameController.text;
    final email = emailController.text.toLowerCase();
    final password = passwordController.text;
    final registerData = RegisterRequest(
      username: username,
      email: email,
      password: password,
      deviceToken: prefs.deviceToken,
      deviceAuthKey: prefs.deviceAuthKey,
    );
    final body = registerRequestToJson(registerData);
    final url = Uri.parse('$baseUrl/users');

    try {
      final response = await http.post(url, headers: headers, body: body);
      final responseBody = jsonDecode(response.body);
      if (response.statusCode == 201) {
        prefs.saveUserEmail(email);
        verifyTypeController.setVerificationType('register');
        verifyTypeController.email.value = email;
        verifyTypeController.startTimer();
        setLoading(false);
        if (context.mounted) {
          showSuccessSnackBar(responseBody['message']);
        }
        Get.to(() => const EmailVerificationCode());
      } else {
        log(response.body);
        setLoading(false);
        showErrorSnackBar(responseBody['message']);
      }
    } catch (error) {
      log(error.toString());
      setLoading(false);
    } finally {
      setLoading(false);
    }
  }

  /// Validates the email input field.
  ///
  /// Checks if the email is not empty and matches the required pattern.
  /// @param context The build context.
  /// @returns A boolean indicating if the email is valid.
  bool validateEmail(BuildContext context) {
    final email = emailController.text;
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@(gmail|yahoo|outlook)\.com$',
    );

    final bool emailMatch = emailRegex.hasMatch(email);
    if (email.isEmpty) {
      showErrorSnackBar(context.translate.email_required);
      emailRequired.value = true;
      emailFocus.requestFocus();
      return false;
    } else if (!emailMatch) {
      showErrorSnackBar(context.translate.email_accepted);
      emailFocus.requestFocus();
      return false;
    }
    return true;
  }

  /// Validates the username input field.
  ///
  /// Checks if the username is not empty and matches the required pattern.
  /// @param context The build context.
  /// @returns A boolean indicating if the username is valid.
  bool validateUserName(BuildContext context) {
    final userName = userNameController.text.split(' ');
    final RegExp userNameRegex = RegExp(r'^[a-zA-Z][a-zA-Z0-9]{5,19}$');
    final first = userNameRegex.hasMatch(userName[0]);
    final second = userNameRegex.hasMatch(userName[1]);
    final userNameMatch = first & second;
    if (userName.isEmpty) {
      userNameRequired.value = true;
      showErrorSnackBar(context.translate.user_name_required);
      userNameFocus.requestFocus();
      return false;
    } else if (!userNameMatch) {
      showErrorSnackBar(context.translate.user_name_error);
      return false;
    }
    userNameRequired.value = false;
    return true;
  }

  /// Validates the password input field.
  ///
  /// Checks if the password is not empty and meets the required validation rules.
  /// @param context The build context.
  /// @returns A boolean indicating if the password is valid.
  bool validatePassword(BuildContext context) {
    final String userPassword = passwordController.text;
    final bool isValidate = password.validationResult.contains(false);

    if (userPassword.isEmpty) {
      showErrorSnackBar(context.translate.password_required);
      passwordRequired.value = true;
      passwordFocus.requestFocus();
      return false;
    }

    if (isValidate) {
      showErrorSnackBar(context.translate.password_not_follow_rules);
      passwordRequired.value = true;
      passwordFocus.requestFocus();
      return false;
    }

    return true;
  }

  /// Sets the loading state.
  ///
  /// @param loading A boolean indicating if a loading process is ongoing.
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Gets the loading state.
  ///
  /// @returns A boolean indicating if a loading process is ongoing.
  bool get isLoading => _isLoading.value;

  /// Disposes of the controllers and focus nodes when the controller is closed.
  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}
