import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:food_zone/features/product/restaurant/data/models/restaurant_hook.dart';
import 'package:http/http.dart' as http;

RestaurantHook useRestaurantHook(String restaurantId) {
  final restaurant = useState<Restaurant?>(null);
  final loading = useState<bool>(false);
  final Uri url = Uri.parse('$baseUrl/restaurant/id/$restaurantId');

  Future<void> fetchRestaurantData() async {
    loading.value = true;
    try {
      final http.Response response =
          await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        restaurant.value = Restaurant.fromJson(decodedBody['data']);
      } else {
        throw Exception('Failed with fetch restaurant data.');
      }
      loading.value = false;
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchRestaurantData();
    return null;
  }, []);

  void reFetch() {
    fetchRestaurantData();
  }

  return RestaurantHook(
    restaurant: restaurant.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
