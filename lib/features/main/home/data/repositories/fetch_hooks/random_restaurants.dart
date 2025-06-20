import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_restaurants/data/models/restaurant_hook.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:http/http.dart' as http;

/// A hook that fetches random restaurants data from the server.
///
/// This hook uses the provided latitude, longitude, page, limit, and size
/// parameters to fetch a list of random restaurants. It manages the loading
/// state and provides a method to re-fetch the data.
///
/// @param lat The latitude for the location to fetch restaurants.
/// @param lon The longitude for the location to fetch restaurants.
/// @param page The page number for pagination.
/// @param limit The number of restaurants to fetch per page.
/// @param size The size of the restaurant data to fetch.
/// @returns A [RestaurantHook] containing the list of restaurants, loading state, and re-fetch method.
RestaurantHook useRestaurantsHook({
  String? lat,
  String? lon,
  double? page,
  double? limit,
  double? size,
}) {
  final restaurants = useState<List<Restaurant>?>(null);
  final loading = useState<bool>(false);

  /// Fetches restaurant data from the server.
  ///
  /// This function constructs the URL using the provided parameters and
  /// sends an HTTP GET request to fetch the restaurant data. It updates
  /// the loading state and the list of restaurants based on the response.
  Future<void> fetchRestaurantData() async {
    loading.value = true;
    final Uri url = Uri.parse(
        '$baseUrl/restaurant/random/?latitude=$lat&longitude=34&page=$page&limit=$limit&size=$size');
    try {
      final http.Response response =
          await http.get(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        final data = randomRestaurantFromJson(response.body);
        restaurants.value = data.data;
      } else {
        throw Exception('Failed with fetch random restaurants');
      }
      loading.value = false;
    } catch (error) {
      rethrow;
    }
  }

  /// Effect hook to fetch restaurant data on component mount.
  ///
  /// This effect runs once when the component is mounted and calls the
  /// [fetchRestaurantData] function to fetch the initial restaurant data.
  useEffect(() {
    fetchRestaurantData();
    return;
  }, []);

  /// Re-fetches the restaurant data.
  ///
  /// This function sets the loading state to true and calls the
  /// [fetchRestaurantData] function to re-fetch the restaurant data.
  void reFetch() {
    loading.value = true;
    fetchRestaurantData();
  }

  return RestaurantHook(
    restaurant: restaurants.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}
