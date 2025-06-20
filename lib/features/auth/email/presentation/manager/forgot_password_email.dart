import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email_otp.dart';
import 'package:food_zone/features/auth/password/presentation/manager/reset_password.dart';

import 'package:http/http.dart' as http;

class ForgotPasswordEmailController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final RxBool emailError = false.obs;

  final RxBool _isLoading = false.obs;

  bool get loading => _isLoading.value;

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Sends a verification code to the user's email for password reset.
  ///
  /// This function first validates the email address entered by the user.
  /// If the email is valid, it sends a request to the server to send an OTP
  /// to the provided email address. It also manages the loading state during
  /// the process.
  ///
  /// @param context The BuildContext used to show snackbars for errors or success messages.
  /// @returns A Future that completes when the OTP has been sent.
  Future sendVerificationPasswordCode(BuildContext context) async {
    final isValidEmail = validateEmail(context);

    if (!isValidEmail) {
      return;
    }
    setLoading(true);
    final email = emailController.text;
    await sendOTPWithEmail(email);
    setLoading(false);
  }

  /// Validates the email address entered by the user.
  ///
  /// This function checks if the email address is not empty and matches
  /// the specified regex pattern for accepted email domains (gmail, yahoo, outlook).
  /// If the email is invalid, it shows an error snackbar and sets the focus to the email input field.
  ///
  /// @param context The BuildContext used to show snackbars for errors.
  /// @returns A boolean indicating whether the email is valid or not.
  bool validateEmail(BuildContext context) {
    final email = emailController.text;
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@(gmail|yahoo|outlook)\.com$',
    );

    final bool emailMatch = emailRegex.hasMatch(email);
    if (email.isEmpty) {
      showErrorSnackBar(context.translate.email_required);
      emailError.value = true;
      emailFocus.requestFocus();
      return false;
    } else if (!emailMatch) {
      showErrorSnackBar(context.translate.email_accepted);
      emailFocus.requestFocus();
      return false;
    }
    return true;
  }

  /// Sends an OTP to the provided email address for password reset.
  ///
  /// This function sends a POST request to the server with the email address.
  /// If the request is successful, it navigates to the email verification code page.
  /// It also manages the loading state and shows appropriate snackbars for success or error messages.
  ///
  /// @param email The email address to which the OTP will be sent.
  /// @returns A Future that completes when the OTP has been sent.
  Future<void> sendOTPWithEmail(String email) async {
    final verifyController = Get.put(VerifyOtpController(), permanent: true);
    final resetPasswordController = Get.put(ResetPasswordController());
    resetPasswordController.emailFormEmailView.value = email;
    final headers = {
      'Content-Type': 'application/json',
      'Accept-Language': prefs.userLanguage
    };
    final data = {'email': email};
    final body = jsonEncode(data);
    final Uri url = Uri.parse('$baseUrl/users/password');
    try {
      final http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );

      final decodedBody = jsonDecode(response.body);
      if (response.statusCode == 200) {
        verifyController.verificationType.value = 'forgot_password';
        verifyController.email.value = email;
        showSuccessSnackBar(decodedBody['message']);

        Get.to(() => const EmailVerificationCode());
      } else {
        showErrorSnackBar(decodedBody['message']);
      }
    } catch (error) {
      setLoading(false);
      rethrow;
    }
  }
}
