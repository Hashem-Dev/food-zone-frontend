import 'dart:async';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';
import 'package:food_zone/features/auth/password/presentation/pages/reset_password.dart';

import 'package:http/http.dart' as http;

class VerifyOtpController extends GetxController {
  final TextEditingController otpTextController = TextEditingController();

  RxString verificationType = ''.obs;
  final RxBool _wrongOtp = false.obs;
  final RxBool _otpLength = false.obs;
  final RxBool _isLoading = false.obs;
  RxString email = ''.obs;

  /// Encrypts the email address by masking part of it with asterisks.
  ///
  /// @returns The encrypted email address.
  String encryptEmail() {
    final emailName = email.value.substring(0, email.value.indexOf('@'));
    final emailNameLength = emailName.length;
    late String encryptedEmail = '';
    const encryptPattern = '*******';
    if (emailNameLength == 1) {
      encryptedEmail = emailName.substring(0) +
          encryptPattern +
          email.value.substring(email.value.indexOf('@'));
    } else if (emailNameLength == 2) {
      encryptedEmail = emailName.substring(0, 1) +
          encryptPattern +
          email.value.substring(email.value.indexOf('@'));
    } else if (emailNameLength == 3) {
      encryptedEmail = emailName.substring(0, 2) +
          encryptPattern +
          email.value.substring(email.value.indexOf('@'));
    } else if (emailNameLength >= 4) {
      encryptedEmail = emailName.substring(0, 3) +
          encryptPattern +
          email.value.substring(email.value.indexOf('@'));
    }
    return encryptedEmail;
  }

  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept-Language': prefs.userLanguage
  };

  /// Sets the loading state of the controller.
  ///
  /// @param loading A boolean indicating whether the controller is in a loading state.
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Gets the current loading state of the controller.
  ///
  /// @returns A boolean indicating whether the controller is in a loading state.
  bool get loading => _isLoading.value;

  /// Sets the verification type (e.g., 'register' or 'forgot_password').
  ///
  /// @param type A string representing the verification type.
  void setVerificationType(String type) {
    verificationType.value = type;
  }

  /// Checks if the OTP length is valid (6 digits).
  ///
  /// Updates the `_otpLength` observable accordingly.
  void checkOtpLength() {
    final otp = otpTextController.text;
    if (otp.length == 6) {
      _otpLength.value = true;
      return;
    }
    _otpLength.value = false;
  }

  /// Resets the error state for OTP verification.
  void setErrorOtpState() {
    _wrongOtp.value = false;
  }

  /// Gets the current verification type.
  ///
  /// @returns A string representing the verification type.
  String get verifyType => verificationType.value;

  /// Gets the current OTP length validity state.
  ///
  /// @returns A boolean indicating whether the OTP length is valid.
  bool get otpLength => _otpLength.value;

  /// Gets the current error state for OTP verification.
  ///
  /// @returns A boolean indicating whether there is an OTP error.
  bool get isWrong => _wrongOtp.value;

  /// Verifies the OTP by sending a request to the server.
  ///
  /// Depending on the verification type, it either verifies the email or resets the password.
  ///
  /// @returns A Future that completes when the OTP verification is done.
  Future verifyOtp() async {
    setLoading(true);

    final otp = int.tryParse(otpTextController.text);
    final body = {'email': email.value, 'otp': otp};
    final data = jsonEncode(body);

    if (verifyType == 'register') {
      final Uri url = Uri.parse('$baseUrl/users/email/');
      final http.Request request = http.Request('PATCH', url);
      request.headers.addAll(headers);
      request.body = data;
      try {
        final http.StreamedResponse response = await request.send();
        final body = jsonDecode(await response.stream.bytesToString());

        if (response.statusCode == 200) {
          showSuccessSnackBar(body['message']);
          Get.offAll(() => const LoginView());
          Get.delete<VerifyOtpController>(force: true);
          setLoading(false);
        } else {
          _wrongOtp.value = true;
          showErrorSnackBar(body['message']);
          setLoading(false);
        }
      } catch (error) {
        rethrow;
      }
    } else if (verifyType == 'forgot_password') {
      final Uri url = Uri.parse('$baseUrl/users/password');
      try {
        final http.Response response = await http.patch(
          url,
          headers: headers,
          body: data,
        );
        final decodedBody = jsonDecode(response.body);
        if (response.statusCode == 200) {
          showSuccessSnackBar(decodedBody['message']);
          setLoading(false);
          Get.to(() => const ResetPasswordView());
        } else {
          showErrorSnackBar(decodedBody['message']);
          setLoading(false);
          _wrongOtp.value = true;
        }
      } catch (error) {
        setLoading(false);
        rethrow;
      }
    }
  }

  /// Resends a new verification code to the user's email.
  ///
  /// @returns A Future that completes when the new verification code is sent.
  Future resendNewVerificationCode() async {
    setLoading(true);
    final Uri url = Uri.parse(
        '$baseUrl/users/${verifyType == 'forgot_password' ? 'password' : 'email'}/');
    final body = {'email': email.value};
    final data = jsonEncode(body);
    final http.Request request = http.Request('POST', url);
    request.headers.addAll(headers);
    request.body = data;
    try {
      final http.StreamedResponse response = await request.send();
      final body = jsonDecode(await response.stream.bytesToString());
      if (response.statusCode == 200) {
        showSuccessSnackBar(body['message']);
        startTimer();
        setLoading(false);
      } else {
        showErrorSnackBar(body['message']);
        setLoading(false);
      }
    } catch (error) {
      rethrow;
    }
  }

  RxInt remainingTime = 120.obs;
  RxBool isButtonDisabled = true.obs;
  Timer? _timer;

  /// Starts a countdown timer for OTP verification.
  ///
  /// The timer counts down from 120 seconds and updates the `remainingTime` observable.
  void startTimer() {
    if (remainingTime.value > 0 && _timer != null) {
      return;
    }
    remainingTime.value = 120;
    isButtonDisabled.value = true;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--;
      } else {
        _timer?.cancel();
        isButtonDisabled.value = false;
      }
    });
  }

  /// Gets the formatted remaining time as a string in MM:SS format.
  ///
  /// @returns A string representing the remaining time.
  String get formattedTime {
    int minutes = remainingTime.value ~/ 60;
    int seconds = remainingTime.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
