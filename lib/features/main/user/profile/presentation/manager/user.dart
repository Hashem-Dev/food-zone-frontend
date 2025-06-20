import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/data/models/login_response.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';

import 'package:http/http.dart' as http;

class UserLogic extends GetxController {
  final Rx<LoginResponse> _userData =
      loginResponseFromJson(jsonEncode(prefs.userData)).obs;
  final _loading = false.obs;

  void updateUserData() {
    _userData.value = loginResponseFromJson(jsonEncode(prefs.userData));
  }

  Future<void> logout() async {
    _loading.value = true;
    final Uri uri = Uri.parse('$baseUrl/users/logout');
    final body = jsonEncode({'id': user.id});
    try {
      final response = await http.post(
        uri,
        headers: prefs.authHeaders,
        body: body,
      );

      if (response.statusCode == 200) {
        await prefs.removeAllSavedData();
        showSuccessSnackBar('Logged out successfully.');
        _loading.value = false;
        Get.deleteAll(force: true);
        Get.offAll(() => const MainScreen());
      } else {
        _loading.value = false;
        showErrorSnackBar('Failed, try logout later!');
      }
    } catch (error) {
      rethrow;
    }
  }

  User get user => _userData.value.user;

  bool get loading => _loading.value;
}
