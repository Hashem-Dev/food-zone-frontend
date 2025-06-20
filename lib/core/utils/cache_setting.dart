import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/home/location/data/models/location_response.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheSetting {
  CacheSetting._internal();

  static final CacheSetting _instance = CacheSetting._internal();
  static SharedPreferences? _preferences;

  static Future<CacheSetting> getInstance() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _instance;
  }

  final String _openFirstTime = 'first_time';
  final String _language = 'language';
  final String _rememberMe = 'remember_me';
  final String _userEmail = 'user_email';
  final String _userPhone = 'user_phone';
  final String _accessToken = 'access_token';
  final String _refreshToken = 'refresh_token';
  final String _userData = 'user_data';
  final String _basketItems = 'basket_items';
  final String _favoriteRestaurant = 'favorite_restaurants';
  final String _favoriteMeals = 'favorite_meals';
  final String _themeMode = 'user_theme_mode';
  final String _pushNotification = 'push_notification';
  final String _appSound = 'app_sound';
  final String _autoUpdate = 'auto_update';
  final String _userLocation = 'user_location';
  final String _defaultLocation = 'default_location';
  final String _deviceToken = 'notification_device_token';
  final String _deviceAuthKey = 'device_auth_key';

  Map<String, String> get authHeaders => {
        'Content-Type': 'application/json',
        'Accept-Language': userLanguage,
        'Authorization': "Bearer $accessToken"
      };

  Future<void> saveDeviceToken(String deviceToken) async {
    await _preferences!.setString(_deviceToken, deviceToken);
    print(deviceToken);
  }

  Future<void> saveDeviceAuthKey(String deviceAuthKey) async {
    await _preferences!.setString(_deviceAuthKey, deviceAuthKey);
    print(deviceAuthKey);
  }

  Future<void> removeAllSavedData() async {
    await _preferences!.remove(_accessToken);
    await _preferences!.remove(_refreshToken);
    await _preferences!.remove(_userData);
    await _preferences!.remove(_basketItems);
    await _preferences!.remove(_favoriteRestaurant);
    await _preferences!.remove(_favoriteMeals);
    await reFreshPreferences();
  }

  /// Clears all items from the basket.
  ///
  /// This function removes all items stored in the basket from the shared preferences
  /// and refreshes the preferences to reflect the changes.
  Future<void> clearBasketItem() async {
    await _preferences!.remove(_basketItems);
    await reFreshPreferences();
  }

  /// Reloads the shared preferences.
  ///
  /// This function reloads the shared preferences to ensure that the latest data is available.
  Future<void> reFreshPreferences() async {
    await _preferences!.reload();
  }

  /// Sets the flag indicating the app is opened for the first time.
  ///
  /// This function sets a boolean flag in the shared preferences to indicate that the app
  /// has been opened for the first time.
  Future<void> setOpenFirstTime() async {
    await _preferences?.setBool(_openFirstTime, true);
  }

  /// Saves the selected language.
  ///
  /// This function saves the selected language code in the shared preferences.
  ///
  /// @param lan The language code to be saved.
  Future<void> saveLanguage(String lan) async {
    await _preferences?.setString(_language, lan);
  }

  /// Saves the remember me option.
  ///
  /// This function saves the user's preference for the "remember me" option in the shared preferences.
  ///
  /// @param rememberMe A boolean indicating whether the user wants to be remembered.
  Future<void> rememberMe(bool rememberMe) async {
    await _preferences?.setBool(_rememberMe, rememberMe);
  }

  /// Saves the user's email.
  ///
  /// This function saves the user's email address in the shared preferences.
  ///
  /// @param email The email address to be saved.
  Future<void> saveUserEmail(String email) async {
    await _preferences?.setString(_userEmail, email);
  }

  /// Saves the user's phone number.
  ///
  /// This function saves the user's phone number in the shared preferences.
  ///
  /// @param phone The phone number to be saved.
  Future<void> saveUserPhone(String phone) async {
    await _preferences?.setString(_userPhone, phone);
  }

  /// Saves the access token.
  ///
  /// This function saves the access token in the shared preferences.
  ///
  /// @param token The access token to be saved.
  Future<void> saveAccessToken(String token) async {
    await _preferences?.setString(_accessToken, token);
  }

  /// Saves the refresh token.
  ///
  /// This function saves the refresh token in the shared preferences.
  ///
  /// @param token The refresh token to be saved.
  Future<void> saveRefreshToken(String token) async {
    await _preferences?.setString(_refreshToken, token);
  }

  /// Saves the user data.
  ///
  /// This function saves the user data in the shared preferences.
  ///
  /// @param data The user data to be saved.
  Future<void> saveUserDate(String data) async {
    await _preferences?.setString(_userData, data);
  }

  /// Saves the basket items.
  ///
  /// This function saves the list of basket items in the shared preferences.
  ///
  /// @param basketItems The list of basket items to be saved.
  Future<void> saveUserBasketItem(List<BasketMeal> basketItems) async {
    final listItem =
        basketItems.map((item) => item.basketItemToJson()).toList();
    final decodedListItem = jsonEncode(listItem);
    await _preferences!.setString(_basketItems, decodedListItem);
  }

  /// Saves the meal additives.
  ///
  /// This function saves the list of selected additives for a specific meal in the shared preferences.
  ///
  /// @param additives The list of selected additives to be saved.
  /// @param mealId The ID of the meal.
  Future<void> saveMealAdditives({
    required List<SelectedAdditives> additives,
    required String mealId,
  }) async {
    final decodedData = additives.map((item) => item.toJson()).toList();
    final decodedListAdditives = jsonEncode(decodedData);
    await _preferences!.setString('${mealId}_additives', decodedListAdditives);
  }

  /// Removes the saved meal additives.
  ///
  /// This function removes the saved additives for a specific meal from the shared preferences.
  ///
  /// @param mealId The ID of the meal.
  Future<void> removeSavedMealAdditives(String mealId) async {
    await _preferences!.remove('${mealId}_additives');
  }

  /// Saves the meal count.
  ///
  /// This function saves the count of a specific meal in the shared preferences.
  ///
  /// @param mealId The ID of the meal.
  /// @param count The count of the meal.
  Future<void> saveMealCount({
    required String mealId,
    required int count,
  }) async {
    await _preferences!.setInt('${mealId}_meal_count', count);
  }

  /// Removes the saved meal count.
  ///
  /// This function removes the saved count for a specific meal from the shared preferences.
  ///
  /// @param mealId The ID of the meal.
  Future<void> removeSavedMealCount(String mealId) async {
    await _preferences!.remove('${mealId}_meal_count');
  }

  /// Saves the favorite restaurants.
  ///
  /// This function saves the list of favorite restaurants for the user in the shared preferences.
  ///
  /// @param restaurants The list of favorite restaurants to be saved.
  Future<void> saveFavoriteRestaurants(List<String> restaurants) async {
    if (userData.isEmpty) return;
    final user = userData['user']['_id'];
    await _preferences!.setStringList(
      '$user-$_favoriteRestaurant',
      restaurants,
    );
  }

  /// Saves the favorite meals.
  ///
  /// This function saves the list of favorite meals for the user in the shared preferences.
  ///
  /// @param meals The list of favorite meals to be saved.
  Future<void> saveFavoriteMeals(List<String> meals) async {
    if (userData.isEmpty) return;
    final user = userData['user']['_id'];
    await _preferences!.setStringList('$user-$_favoriteMeals', meals);
  }

  /// Saves the theme mode.
  ///
  /// This function saves the selected theme mode in the shared preferences.
  ///
  /// @param mode The theme mode to be saved.
  Future<void> saveThemeMode(String mode) async {
    await _preferences!.setString(_themeMode, mode);
  }

  /// Saves the push notification state.
  ///
  /// This function saves the state of push notifications in the shared preferences.
  ///
  /// @param state A boolean indicating whether push notifications are enabled.
  Future<void> savePushNotificationState(bool state) async {
    await _preferences!.setBool(_pushNotification, state);
  }

  /// Saves the app sound state.
  ///
  /// This function saves the state of app sounds in the shared preferences.
  ///
  /// @param state A boolean indicating whether app sounds are enabled.
  Future<void> saveAppSoundState(bool state) async {
    await _preferences!.setBool(_appSound, state);
  }

  /// Saves the auto-update state.
  ///
  /// This function saves the state of auto-updates in the shared preferences.
  ///
  /// @param state A boolean indicating whether auto-updates are enabled.
  Future<void> saveAutoUpdateState(bool state) async {
    await _preferences!.setBool(_autoUpdate, state);
  }

  /// Saves the user location.
  ///
  /// This function saves the list of user location points in the shared preferences.
  ///
  /// @param points The list of location points to be saved.
  Future<void> saveUserLocation(List<String> points) async {
    await _preferences!.setStringList(_userLocation, points);
  }

  /// Saves the default location.
  ///
  /// This function saves the default location in the shared preferences.
  ///
  /// @param location The default location to be saved.
  Future<void> saveDefaultLocation(Map<String, dynamic> location) async {
    final locationData = jsonEncode(location);
    await _preferences!.setString(_defaultLocation, locationData);
    await reFreshPreferences();
  }

  ///+=+=+=+=+=++++++++======================++

  String get deviceToken => _preferences!.getString(_deviceToken) ?? '';

  String get deviceAuthKey => _preferences!.getString(_deviceAuthKey) ?? '';

  Map<String, dynamic> get deliveryLocation {
    final String? decodedData = _preferences!.getString(_defaultLocation);
    if (decodedData == null) {
      return {};
    }
    final deliverLocation = jsonDecode(decodedData);
    return deliverLocation;
  }

  List<Location> get userLocation {
    final List<Location> locationCoords = [];
    final List<String> decodedList =
        _preferences!.getStringList(_userLocation) ?? [];
    if (decodedList.isEmpty) {
      return [];
    } else {
      for (final location in decodedList) {
        locationCoords.add(locationCoordsFromJson(location));
      }
    }
    return locationCoords;
  }

  bool get openFirstTime => _preferences?.getBool(_openFirstTime) ?? false;

  String get userLanguage => _preferences?.getString(_language) ?? 'en';

  bool get rememberUser => _preferences?.getBool(_rememberMe) ?? false;

  String get userEmail => _preferences?.getString(_userEmail) ?? '';

  String get userPhone => _preferences?.getString(_userPhone) ?? '';

  String get accessToken => _preferences?.getString(_accessToken) ?? '';

  String get refreshToken => _preferences?.getString(_refreshToken) ?? '';

  Map<String, dynamic> get userData {
    final data = _preferences?.getString(_userData);
    if (data == null) {
      return {};
    }
    return jsonDecode(data);
  }

  List<BasketMeal> get userBasketItems {
    final decodedList = _preferences!.getString(_basketItems);
    if (decodedList == null) {
      return [];
    }
    final List listItem = jsonDecode(decodedList);
    final items = listItem.map((item) => BasketMeal.fromJson(item)).toList();
    return items;
  }

  List<SelectedAdditives> selectedMealAdditives({required String mealId}) {
    final decodedList = _preferences!.getString('${mealId}_additives');

    if (decodedList == null) {
      return [];
    }
    final List listItem = jsonDecode(decodedList);
    final additives = listItem.map((additive) {
      return SelectedAdditives.fromJson(additive);
    }).toList();
    return additives;
  }

  int mealItemCount(String mealId) {
    return _preferences!.getInt('${mealId}_meal_count') ?? 1;
  }

  List<String> userFavoriteRestaurants() {
    if (userData.isEmpty) {
      return [];
    }
    final user = userData['user']['_id'];
    return _preferences!.getStringList('$user-$_favoriteRestaurant') ?? [];
  }

  List<String> userFavoriteMeals() {
    if (userData.isEmpty) {
      return [];
    }
    final user = userData['user']['_id'];
    return _preferences!.getStringList('$user-$_favoriteMeals') ?? [];
  }

  ThemeMode savedThemeMode() {
    final String mode = _preferences!.getString(_themeMode) ?? 'system';
    if (mode == 'light') {
      return ThemeMode.light;
    } else if (mode == 'dark') {
      return ThemeMode.dark;
    } else {
      return ThemeMode.system;
    }
  }

  bool get pushNotificationState {
    return _preferences!.getBool(_pushNotification) ?? true;
  }

  bool get appSoundState => _preferences!.getBool(_appSound) ?? true;

  bool get autoUpdateState => _preferences!.getBool(_autoUpdate) ?? true;
}
