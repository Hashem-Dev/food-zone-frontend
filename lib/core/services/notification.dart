import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:food_zone/exports.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Callback function to handle notification taps.
  ///
  /// @param notificationResponse The response received when a notification is tapped.
  static onTap(NotificationResponse notificationResponse) {}

  /// Initializes the notification service.
  ///
  /// Registers the device with Pushy and saves the device token and authentication key.
  /// Sets up the notification plugin with the specified initialization settings.
  ///
  /// @returns A [Future] that completes when the initialization is done.
  static Future notificationInit() async {
    try {
      String deviceToken = await Pushy.register();
      final deviceAuthKey =
          await Pushy.getDeviceCredentials() as Map<String, dynamic>;
      await prefs.saveDeviceToken(deviceToken);
      await prefs.saveDeviceAuthKey(deviceAuthKey['authKey'].toString());
    } catch (error) {
      rethrow;
    }
    const InitializationSettings setting = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    );
    notificationsPlugin.initialize(
      setting,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  /// Requests notification permission from the user.
  ///
  /// This function requests the necessary permissions for displaying notifications on Android devices.
  ///
  /// @returns A [Future] that completes when the permission request is done.
  static Future<void> requestNotificationPermission() async {
    final AndroidFlutterLocalNotificationsPlugin androidPlugin =
        NotificationService
            .notificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()!;
    await androidPlugin.requestNotificationsPermission();
  }

  /// Sends a push notification with the specified title and body.
  ///
  /// Generates a random ID for the notification and sets up the notification details.
  /// Displays the notification using the FlutterLocalNotificationsPlugin.
  ///
  /// @param title The title of the notification.
  /// @param body The body content of the notification.
  /// @returns A [Future] that completes when the notification is shown.
  static Future pushNotification(String title, String body) async {
    final randomId = Random().nextInt(10000);
    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails(
        '$randomId',
        'FoodZone',
        channelDescription: 'Notifications for FoodZone app.',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await notificationsPlugin.show(
      randomId,
      title,
      body,
      notificationDetails,
      payload: '',
    );
  }
}
