import 'package:food_zone/exports.dart';

import 'package:food_zone/features/product/restaurant/data/models/restaurant_meals.dart';
import 'package:http/http.dart' as http;

List<RestaurantMeals>? useRestaurantMealsHook(String? restaurantId) {
  final restaurantMeals = useState<List<RestaurantMeals>?>(null);
  final Uri url = Uri.parse('$baseUrl/meal/restaurant/$restaurantId');

  Future<void> fetchRestaurantMeals() async {
    try {
      final response = await http.get(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        restaurantMeals.value = restaurantMealsFromJson(response.body);
      } else {
        throw Exception('Failed with fetch restaurant meals');
      }
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchRestaurantMeals();
    return;
  }, []);

  return restaurantMeals.value;
}
