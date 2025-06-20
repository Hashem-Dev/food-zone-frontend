import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';
import 'package:food_zone/features/auth/register/presentation/pages/register.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';
import 'package:http/http.dart' as http;

class VerifyTokenController extends GetxController {
  final String language = prefs.userLanguage;
  final bool openFirstTime = prefs.openFirstTime;
  final bool rememberMe = prefs.rememberUser;

  Future verifyToken() async {
    final Uri url = Uri.parse('$baseUrl/token/');

    try {
      final http.Response response =
          await http.post(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        if (rememberMe) {
          Get.off(() => const MainScreen());
          Get.delete<VerifyTokenController>(force: true);
          return;
        }
        Get.offAll(() => const LoginView());
        Get.delete<VerifyTokenController>(force: true);
      } else if (response.statusCode == 401) {
        Get.delete<VerifyTokenController>(force: true);
        Get.offAll(() => const RegisterView());
      } else {
        Get.delete<VerifyTokenController>(force: true);
        Get.offAll(() => const LoginView());
      }
    } catch (error) {
      rethrow;
    }
  }
}
