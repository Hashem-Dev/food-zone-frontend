import 'package:food_zone/core/controllers/add_to_favorite.dart';
import 'package:food_zone/exports.dart';
import 'package:http/http.dart' as http;

class LoadUserDataController extends GetxController {
  final Uri restaurantUrl = Uri.parse('$baseUrl/restaurant/favorite');
  final Uri mealsUrl = Uri.parse('$baseUrl/meal/favorite');

  final favoriteController = Get.put(AddProductToFavoriteController());

  Future<void> loadFavoriteRestaurant() async {
    if (prefs.accessToken.isEmpty) {
      return;
    }
    try {
      final response =
          await http.get(restaurantUrl, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final List<String> restaurants = jsonList.cast<String>();

        await prefs.saveFavoriteRestaurants(restaurants);
        favoriteController.setFavoriteRestaurant();
        Get.delete<LoadUserDataController>(force: true);
      } else {
        throw Exception('Failed to load favorite restaurants.');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> loadFavoriteMeals() async {
    try {
      if (prefs.accessToken.isNotEmpty) {
        final response = await http.get(mealsUrl, headers: prefs.authHeaders);

        if (response.statusCode == 200) {
          final List<dynamic> jsonList = jsonDecode(response.body);
          final List<String> meals = jsonList.cast<String>();

          await prefs.saveFavoriteMeals(meals);
          favoriteController.setFavoriteMeals();
          Get.delete<LoadUserDataController>(force: true);
        } else {
          throw Exception('Failed to load favorite meals.');
        }
      } else {
        return;
      }
    } catch (error) {
      rethrow;
    }
  }
}
