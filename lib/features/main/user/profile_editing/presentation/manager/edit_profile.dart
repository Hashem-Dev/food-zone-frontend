import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';
import 'package:food_zone/features/main/user/profile/presentation/manager/user.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  final UserLogic controller = Get.find();
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userDate = TextEditingController();
  final userPhone = TextEditingController();
  final userDateNode = FocusNode();

  final RxString _radioValue = ''.obs;
  final _loading = false.obs;

  @override
  void onInit() {
    userName.text = controller.user.name.en;
    userEmail.text = controller.user.email;
    userPhone.text = controller.user.phone.toString();
    userDate.text = DateFormat('yyyy-MM-dd').format(
      controller.user.dateOfBirth,
    );
    selectGender(controller.user.gender);
    super.onInit();
  }

  void selectGender(String gender) {
    _radioValue.value = gender;
  }

  String get gender => _radioValue.value;

  bool get loading => _loading.value;

  Future<void> datePicker(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      firstDate: DateTime(1960),
      lastDate: DateTime(DateTime.now().year - 15),
      switchToCalendarEntryModeIcon: const Icon(
        SolarIconsBold.calendarMinimalistic,
        color: neutral100,
      ),
      switchToInputEntryModeIcon: const Icon(
        SolarIconsBold.pen,
        color: neutral100,
      ),
      keyboardType: TextInputType.datetime,
    );
    if (date != null) {
      userDate.text = DateFormat('yyyy-MM-dd').format(date);
      userDateNode.nextFocus();
    }
  }

  Future<void> removeProfileAvatar() async {
    _loading.value = true;
    final Uri uri = Uri.parse('$baseUrl/users/avatar-remove');
    try {
      final response = await http.patch(uri, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        await prefs.saveUserDate(response.body);
        await prefs.reFreshPreferences();
        _loading.value = true;
        Get.find<UserLogic>().updateUserData();
        Get.back();
        showSuccessSnackBar('Profile image removed successfully.');
        _loading.value = false;
      } else {
        _loading.value = false;
        showErrorSnackBar('Failed to remove profile image.');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateProfileData() async {
    final oldEmail = controller.user.email;
    if (userName.text.isEmpty || userName.text.length < 8) {
      showErrorSnackBar('Name is too short.');
    }
    _loading.value = true;
    final Uri url = Uri.parse('$baseUrl/users/');

    late String body;

    if (controller.user.email != userEmail.text) {
      body = jsonEncode({
        "email": userEmail.text,
        "phone": userPhone.text,
        "username": userName.text,
        "dateOfBirth": userDate.text,
        "gender": gender
      });
    } else {
      body = jsonEncode({
        "phone": userPhone.text,
        "username": userName.text,
        "dateOfBirth": userDate.text,
        "gender": gender
      });
    }

    try {
      final response = await http.patch(
        url,
        headers: prefs.authHeaders,
        body: body,
      );
      if (response.statusCode == 200) {
        await prefs.saveUserDate(response.body);
        await prefs.reFreshPreferences();
        controller.updateUserData();
        showSuccessSnackBar('Your profile updated successfully.');
        if (oldEmail != userEmail.text) {
          Get.offAll(() => const LoginView());
        }
      } else if (response.statusCode == 409) {
        final decodedData = jsonDecode(response.body);
        showErrorSnackBar(decodedData['message']);
      } else {
        showErrorSnackBar('Update profile is failed!');
      }
      _loading.value = false;
    } catch (error) {
      _loading.value = false;
      rethrow;
    }
  }

  @override
  void onClose() {
    userName.dispose();
    userEmail.dispose();
    userDate.dispose();
    userPhone.dispose();
    userDateNode.dispose();

    super.onClose();
  }
}
