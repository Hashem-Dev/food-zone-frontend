import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_restaurants.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_restaurants_hook.dart';
import 'package:http/http.dart' as http;

FavoriteRestaurantsHook? useFavoriteRestaurantHook() {
  final ValueNotifier restaurants = useState<FavoriteRestaurants?>(null);
  final ValueNotifier loading = useState<bool>(false);
  Future<void> fetchFavoriteRestaurants() async {
    final Uri url = Uri.parse('$baseUrl/users/favorite?detailType=restaurants');
    try {
      loading.value = true;
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        restaurants.value = favoriteRestaurantsFromJson(response.body);
      } else {
        throw Exception('Failed to fetch favorite restaurants');
      }
      loading.value = false;
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchFavoriteRestaurants();
    return;
  }, []);

  void reFetch() {
    loading.value = true;
    fetchFavoriteRestaurants();
  }

  return FavoriteRestaurantsHook(
    restaurants: restaurants.value?.restaurants,
    reFetch: reFetch,
    loading: loading.value,
  );
}
