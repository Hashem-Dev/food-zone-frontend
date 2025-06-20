import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/notifications/data/data_sources/notifications_hooks.dart';
import 'package:food_zone/features/main/notifications/data/models/notification_response.dart';
import 'package:http/http.dart' as http;

NotificationsHooks? userNotificationHook() {
  final notifications = useState<NotificationsResponse?>(null);
  final loading = useState<bool>(false);

  Future<void> fetchNotificationData() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/notification/user');
    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        notifications.value = notificationsResponseFromJson(response.body);
        loading.value = false;
      } else {
        loading.value = false;
        log(response.statusCode.toString());
        showErrorSnackBar('Failed to fetch notifications data');
      }
    } catch (error) {
      loading.value = false;
      log(error.toString());
    } finally {
      loading.value = false;
    }
  }

  useEffect(() {
    fetchNotificationData();
    return;
  }, []);

  void reFetch() {
    fetchNotificationData();
  }

  return NotificationsHooks(
    notifications: notifications.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}

Future<void> readSpecificNotification(String id) async {
  final Uri url = Uri.parse('$baseUrl/notification/user?notification=$id');

  try {
    final response = await http.patch(url, headers: prefs.authHeaders);
    if (response.statusCode == 200) {
    } else {
      log('${response.statusCode} form read specific notification.');
      log('${response.body} form read specific notification.');
    }
  } catch (error) {
    log(error.toString());
  }
}

Future<void> deleteSpecificNotification(String id) async {
  final Uri url = Uri.parse('$baseUrl/notification/user?notification=$id');

  try {
    final response = await http.delete(url, headers: prefs.authHeaders);
    if (response.statusCode == 204) {
    } else {
      log('${response.statusCode} form delete specific notification.');
      log('${response.body} form delete specific notification.');
    }
  } catch (error) {
    log(error.toString());
  }
}

Future<void> readAllNotifications() async {
  final Uri uri = Uri.parse('$baseUrl/notification/user/read-all');
  try {
    final response = await http.patch(uri, headers: prefs.authHeaders);
    if (response.statusCode != 200) {
      log('${response.statusCode} form read all notification.');
      log('${response.body} form read all notification.');
    }
  } catch (error) {
    log(error.toString());
  }
}

Future<void> deleteAllNotifications() async {
  final Uri url = Uri.parse('$baseUrl/notification/user/delete-all');
  try {
    final response = await http.delete(url, headers: prefs.authHeaders);
    if (response.statusCode != 204) {
      log('${response.statusCode} form delete specific notification.');
      log('${response.body} form delete specific notification.');
    }
  } catch (error) {
    log(error.toString());
  }
}
