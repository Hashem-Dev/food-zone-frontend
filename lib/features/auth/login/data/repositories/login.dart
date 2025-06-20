import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email_otp.dart';
import 'package:food_zone/features/auth/login/data/models/login_request.dart';
import 'package:food_zone/features/auth/login/data/models/login_response.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';
import 'package:food_zone/features/splash/data/repositories/load_user_data.dart';

import 'package:http/http.dart' as http;

/// Controller for handling login functionality.
class LoginController extends GetxController {
  /// Controller for email input field.
  final TextEditingController emailController = TextEditingController();

  /// Controller for password input field.
  final TextEditingController passwordController = TextEditingController();

  /// Focus node for email input field.
  final FocusNode emailFocus = FocusNode();

  /// Focus node for password input field.
  final FocusNode passwordFocus = FocusNode();

  /// Observable boolean to indicate if email is required.
  final RxBool emailRequired = false.obs;

  /// Observable boolean to indicate if password is required.
  final RxBool passwordRequired = false.obs;

  /// Observable boolean to indicate if email should be filled automatically.
  final RxBool fillEmail = true.obs;

  /// Controller for managing password validation.
  final LoginPasswordController password = Get.put(LoginPasswordController());

  /// Controller for loading user data.
  final dataController = Get.put(LoadUserDataController());

  /// Observable boolean to indicate loading state.
  final RxBool _isLoading = false.obs;

  /// Initiates the login process.
  ///
  /// Validates email and password, sends login request, and handles response.
  /// @param context The BuildContext of the widget.
  void login(BuildContext context) async {
    final bool isValidEmail = validateEmail(context);
    if (!isValidEmail) {
      return;
    }

    final bool isValidPassword = validatePassword(context);
    if (!isValidPassword) {
      return;
    }

    setLoading(true);
    final email = emailController.text;
    final password = passwordController.text;

    final LoginRequest data = LoginRequest(
      email: email,
      password: password,
      deviceToken: prefs.deviceToken,
      deviceAuthKey: prefs.deviceAuthKey,
    );
    final body = loginRequestToJson(data);

    final url = Uri.parse('$baseUrl/users/');
    try {
      final request = http.Request('GET', url);
      request.body = body;
      request.headers.addAll(headers);
      final response = await request.send();
      final encodedUserData = await response.stream.bytesToString();
      final decodedResponse = jsonDecode(encodedUserData);

      if (response.statusCode == 200) {
        final userData = loginResponseFromJson(encodedUserData);
        await prefs.saveUserEmail(userData.user.email);
        await prefs.saveAccessToken(userData.user.accessToken);
        await prefs.saveRefreshToken(userData.user.refreshToken);
        await prefs.saveUserDate(encodedUserData);
        await prefs.reFreshPreferences();
        await dataController.loadFavoriteRestaurant();
        await dataController.loadFavoriteMeals();
        if (context.mounted) {
          showSuccessSnackBar(context.translate.welcome_back);
        }
        setLoading(false);
        Get.deleteAll(force: true);
        Get.delete<LoginPasswordController>(force: true);
        Get.delete<LoginController>(force: true);

        Get.offAll(() => const MainScreen());
      } else if (response.statusCode == 409) {
        final verifyTypeController = Get.put(
          VerifyOtpController(),
          permanent: true,
        );
        showErrorSnackBar(decodedResponse['message']);
        Get.to(() => const EmailVerificationCode());
        verifyTypeController.verificationType.value = 'register';
        verifyTypeController.email.value = emailController.text;
        setLoading(false);
      } else {
        showErrorSnackBar(decodedResponse['message']);
        setLoading(false);
      }
    } catch (error) {
      setLoading(false);
      rethrow;
    }
  }

  /// Validates the email input.
  ///
  /// Checks if the email is not empty and matches the required pattern.
  /// @param context The BuildContext of the widget.
  /// @returns `true` if the email is valid, otherwise `false`.
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

  /// Validates the password input.
  ///
  /// Checks if the password is not empty and meets the validation criteria.
  /// @param context The BuildContext of the widget.
  /// @returns `true` if the password is valid, otherwise `false`.
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

  /// Sets the email input field with the saved user email.
  void setEmail() {
    final String userEmail = prefs.userEmail;
    if (fillEmail.value) {
      if (userEmail.isNotEmpty) {
        emailController.text = userEmail;
      }
    }
    fillEmail.value = false;
  }

  /// Sets the loading state.
  ///
  /// @param loading The loading state to set.
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Gets the current loading state.
  ///
  /// @returns `true` if loading, otherwise `false`.
  bool get loading => _isLoading.value;

  /// Disposes the controllers and focus nodes when the controller is closed.
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
