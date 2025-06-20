import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/models/meal.dart';
import 'package:http/http.dart' as http;

/// Hook to fetch meals for a specific category.
///
/// This hook fetches meals from the server based on the provided category ID.
/// It manages the loading state and stores the fetched meals in a state variable.
///
/// @param categoryId The ID of the category to fetch meals for.
/// @returns A list of [CategoryMealsData] or null if the data is not yet fetched.
List<CategoryMealsData>? useCategoryMealsHook(String categoryId) {
  final meals = useState<List<CategoryMealsData>?>(null);
  final loading = useState<bool>(false);

  /// Fetches meals for the specified category from the server.
  ///
  /// This function sends an HTTP GET request to the server to fetch meals
  /// for the given category ID. It updates the loading state and stores
  /// the fetched meals in the state variable.
  ///
  /// @throws Exception if the request fails.
  Future<void> fetchCategoryMeals() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/meal/category/$categoryId');

    try {
      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        meals.value = categoryMealsDataFromJson(response.body);
      } else {
        throw Exception('Failed with fetch category meals');
      }
      loading.value = false;
    } catch (error) {
      loading.value = false;
      rethrow;
    }
  }

  /// Effect hook to fetch meals when the component is mounted.
  ///
  /// This hook triggers the fetchCategoryMeals function when the component
  /// is first mounted. It ensures that the meals are fetched as soon as the
  /// component is rendered.
  useEffect(() {
    loading.value = true;
    fetchCategoryMeals();
    return;
  }, []);

  return meals.value;
}
