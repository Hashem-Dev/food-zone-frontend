import 'package:food_zone/exports.dart';
import 'package:http/http.dart' as http;

class AddProductToFavoriteController extends GetxController {
  final RxList<String> restaurantIds = RxList(prefs.userFavoriteRestaurants());
  final RxList<String> mealIds = RxList(prefs.userFavoriteMeals());
  final RxBool _isLoading = false.obs;

  /// Sets the list of favorite restaurants from preferences.
  /// This method updates the [restaurantIds] list with the user's favorite restaurants
  /// and refreshes the list to notify listeners of the change.
  void setFavoriteRestaurant() {
    restaurantIds.assignAll(prefs.userFavoriteRestaurants());
    restaurantIds.refresh();
  }

  /// Sets the list of favorite meals from preferences.
  /// This method updates the [mealIds] list with the user's favorite meals
  /// and refreshes the list to notify listeners of the change.
  void setFavoriteMeals() {
    mealIds.assignAll(prefs.userFavoriteMeals());
    mealIds.refresh();
  }

  /// Adds or removes a restaurant from the user's favorites.
  /// This method sends a PATCH request to update the favorite status of a restaurant.
  /// If the request is successful, it updates the [restaurantIds] list and saves the changes to preferences.
  /// @param id The ID of the restaurant to add or remove from favorites.
  /// @returns A [Future] that completes when the operation is finished.
  Future<void> addRestaurantToFavorite(String id) async {
    _isLoading.value = true;
    final Uri url = Uri.parse('$baseUrl/restaurant/favorite/$id');

    try {
      final http.Response response = await http.patch(
        url,
        headers: prefs.authHeaders,
      );

      if (response.statusCode == 200) {
        if (restaurantIds.contains(id)) {
          restaurantIds.remove(id);
        } else {
          restaurantIds.add(id);
        }
        await prefs.saveFavoriteRestaurants(restaurantIds);
        _isLoading.value = false;
      } else {
        throw Exception('Failed to update favorite status.');
      }
    } catch (error) {
      rethrow;
    }
  }

  /// Adds or removes a meal from the user's favorites.
  /// This method sends a PATCH request to update the favorite status of a meal.
  /// If the request is successful, it updates the [mealIds] list and saves the changes to preferences.
  /// @param id The ID of the meal to add or remove from favorites.
  /// @returns A [Future] that completes when the operation is finished.
  Future<void> addMealToFavorite(String id) async {
    final Uri url = Uri.parse('$baseUrl/meal/favorite/$id');

    try {
      final http.Response response = await http.patch(
        url,
        headers: prefs.authHeaders,
      );
      if (response.statusCode == 200) {
        if (mealIds.contains(id)) {
          mealIds.remove(id);
          mealIds.refresh();
        } else {
          mealIds.add(id);
          mealIds.refresh();
        }
      } else {
        throw Exception('Failed update favorite meals');
      }
      await prefs.saveFavoriteMeals(mealIds);
    } catch (error) {
      rethrow;
    }
  }

  /// Indicates whether a loading operation is in progress.
  /// @returns A [bool] that is true if a loading operation is in progress, false otherwise.
  bool get loading => _isLoading.value;
}
