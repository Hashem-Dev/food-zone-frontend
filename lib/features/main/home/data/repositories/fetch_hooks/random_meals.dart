import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/data_sources/hooks/random_meals.dart';
import 'package:food_zone/features/main/home/data/models/random_meals.dart';
import 'package:http/http.dart' as http;

/// Hook to fetch random meals data from the server.
///
/// This hook manages the state of random meals and loading status.
/// It fetches data from the server based on the provided parameters and updates the state accordingly.
///
/// @param lat The latitude for the location-based meal search.
/// @param lon The longitude for the location-based meal search.
/// @param page The page number for pagination.
/// @param limit The number of items per page.
/// @param size The size of the meal items.
/// @returns A [RandomMealsHook] containing the random meals data, loading status, and a function to refetch the data.
RandomMealsHook useRandomMealsHook({
  String? lat,
  String? lon,
  double? page,
  double? limit,
  double? size,
}) {
  final meals = useState<RandomMeals?>(null);
  final loading = useState<bool>(false);

  /// Fetches random meals data from the server.
  ///
  /// This function constructs the URL with the provided parameters, sends an HTTP GET request,
  /// and updates the state with the fetched data or handles errors if any.
  Future<void> fetchRandomMeals() async {
    loading.value = true;
    final Uri url = Uri.parse(
        '$baseUrl/meal/?latitude=$lat&longitude=34&page=$page&limit=$limit&size=$size');

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        meals.value = randomMealsFromJson(response.body);
      } else {
        print(response.statusCode);
        print(response.body);
      }
      loading.value = false;
    } catch (error) {
      loading.value = false;
      rethrow;
    }
  }

  /// Effect hook to fetch random meals data when the component is mounted.
  ///
  /// This hook triggers the [fetchRandomMeals] function when the component is first rendered.
  useEffect(() {
    loading.value = true;
    fetchRandomMeals();
    return;
  }, []);

  /// Refetches the random meals data.
  ///
  /// This function can be called to manually refetch the random meals data.
  void reFetch() {
    fetchRandomMeals();
  }

  return RandomMealsHook(
    randomMeals: meals.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
