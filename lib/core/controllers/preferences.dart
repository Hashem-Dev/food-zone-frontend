import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_zone/config/theme/colors.dart';
import 'package:food_zone/core/services/notification.dart';
import 'package:food_zone/main.dart';
import 'package:get/get.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

class PreferencesController extends GetxController with WidgetsBindingObserver {
  Rx<Locale> language = (Get.deviceLocale ?? const Locale('en')).obs;
  final Rx<ThemeMode> themeMode = prefs.savedThemeMode().obs;
  final RxBool _pushNotification = prefs.pushNotificationState.obs;
  final RxBool _sound = prefs.appSoundState.obs;
  final RxBool _autoUpdate = prefs.autoUpdateState.obs;
  final RxMap<String, dynamic> _deliveryLocation = prefs.deliveryLocation.obs;

  /// Toggles the push notification setting and saves the new state.
  void updatePushNotification() {
    _pushNotification.value = !_pushNotification.value;
    prefs.savePushNotificationState(_pushNotification.value);
  }

  /// Toggles the app sound setting and saves the new state.
  void updateAppSound() {
    _sound.value = !_sound.value;
    prefs.saveAppSoundState(_sound.value);
  }

  /// Toggles the auto-update setting and saves the new state.
  void changeAutoUpdate() {
    _autoUpdate.value = !_autoUpdate.value;
    prefs.saveAutoUpdateState(_autoUpdate.value);
  }

  /// Updates the delivery location with the provided [location] map.
  ///
  /// @param location A map containing the new delivery location details.
  void updateDeliveryLocation(Map<String, dynamic> location) {
    _deliveryLocation.value = location;
  }

  /// Gets the current state of push notifications.
  ///
  /// @returns A boolean indicating whether push notifications are enabled.
  bool get pushNotificationState => _pushNotification.value;

  /// Gets the current state of app sound.
  ///
  /// @returns A boolean indicating whether app sound is enabled.
  bool get appSoundState => _sound.value;

  /// Gets the current state of auto-update.
  ///
  /// @returns A boolean indicating whether auto-update is enabled.
  bool get autoUpdateState => _autoUpdate.value;

  /// Gets the current delivery location.
  ///
  /// @returns A map containing the current delivery location details.
  Map<String, dynamic> get deliveryLocation => _deliveryLocation;

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);
    _updateSystemUI(themeMode.value);
    Pushy.listen();

    Pushy.setNotificationListener(backgroundNotificationListener);
    super.onInit();
  }

  @pragma('vm:entry-point')
  void backgroundNotificationListener(Map<String, dynamic> data) async {
    String notificationTitle = data['title'];
    String notificationText = data['message'];
    //Pushy.notify(notificationTitle, notificationText, data);
    await NotificationService.pushNotification(
        notificationTitle, notificationText);
    Pushy.clearBadge();
  }

  @override
  void didChangePlatformBrightness() {
    _updateSystemUI(themeMode.value);
  }

  /// Updates the system UI based on the provided [mode].
  ///
  /// @param mode The theme mode to apply to the system UI.
  void _updateSystemUI(ThemeMode mode) {
    final isDarkMode = mode == ThemeMode.dark ||
        (mode == ThemeMode.system &&
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isDarkMode ? neutral900 : primaryWhite,
      ),
    );
  }

  /// Changes the app language to the specified [lan].
  ///
  /// @param lan The language code to set as the new app language.
  void changeLanguage(String lan) {
    language.value = Locale(lan);
    Get.updateLocale(language.value);
    prefs.saveLanguage(lan);
    update();
  }

  /// Changes the theme mode to the specified [mode].
  ///
  /// @param mode The theme mode to set ('light', 'dark', or 'system').
  void changeThemeMode(String mode) {
    if (mode == 'light') {
      themeMode.value = ThemeMode.light;
      prefs.saveThemeMode('light');
    } else if (mode == 'dark') {
      themeMode.value = ThemeMode.dark;
      prefs.saveThemeMode('dark');
    } else {
      themeMode.value = ThemeMode.system;
      prefs.saveThemeMode('system');
    }
    _updateSystemUI(themeMode.value);
  }

  /// Gets the current theme mode as a string.
  ///
  /// @returns A string representing the current theme mode ('light', 'dark', or 'system').
  String getThemeModeText() {
    if (themeMode.value == ThemeMode.light) {
      return 'light';
    } else if (themeMode.value == ThemeMode.dark) {
      return 'dark';
    } else {
      return 'system';
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
