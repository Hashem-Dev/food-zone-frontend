import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/data/repositories/verify_otp.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email_otp.dart';
import 'package:http/http.dart' as http;

/// Controller for managing the bottom sheet in the login feature.
class BottomSheetController extends GetxController {
  /// Observable string to track the selected type (e.g., 'email').
  final RxString _selectType = 'email'.obs;

  /// Sets the selected type for sending OTP.
  ///
  /// @param type The type to be selected (e.g., 'email').
  void selectSendType(String type) {
    _selectType.value = type;
  }

  /// Gets the currently selected type for sending OTP.
  ///
  /// @returns The selected type as a string.
  String get selectedSendType => _selectType.value;

  /// Observable boolean to track the loading state.
  final RxBool _isLoading = false.obs;

  /// Sets the loading state.
  ///
  /// @param loading The loading state to be set.
  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  /// Gets the current loading state.
  ///
  /// @returns The loading state as a boolean.
  bool get loading => _isLoading.value;

  /// Sends an OTP to the provided email address.
  ///
  /// This function sends a POST request to the server to send an OTP to the
  /// specified email address. It updates the loading state and handles the
  /// response by showing appropriate snack bars and navigating to the email
  /// verification page if successful.
  ///
  /// @param email The email address to which the OTP should be sent.
  /// @returns A Future that completes when the OTP has been sent.
  Future<void> sendOTPWithEmail(String email) async {
    setLoading(true);
    final verifyController = Get.put(VerifyOtpController(), permanent: true);
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

      await Future.delayed(const Duration(seconds: 5), () => setLoading(false));
    } catch (error) {
      setLoading(false);
      rethrow;
    }
  }
}
