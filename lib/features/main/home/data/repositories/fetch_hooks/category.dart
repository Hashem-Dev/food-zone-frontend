import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/data_sources/hooks/category.dart';
import 'package:food_zone/features/main/home/data/models/category_response.dart';
import 'package:http/http.dart' as http;

/// A custom hook that fetches categories from the server and manages loading state.
///
/// This hook is used to fetch categories from the server and manage the loading state.
/// It returns a [CategoryHook] object containing the list of categories and the loading state.
///
/// @returns [CategoryHook] containing the list of categories and the loading state.
CategoryHook useCategoryHook() {
  /// State to hold the list of categories.
  final categories = useState<List<CategoryResponse>?>(null);

  /// State to hold the loading status.
  final loading = useState<bool>(false);

  /// Fetches categories from the server.
  ///
  /// This function sends a GET request to the server to fetch categories.
  /// It updates the [categories] state with the fetched data and sets the [loading] state accordingly.
  ///
  /// @throws Error if the request fails.
  Future<void> fetchCategories() async {
    loading.value = true;

    final Uri url = Uri.parse('$baseUrl/category/');

    try {
      final http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonEncode(jsonDecode(response.body)['data']);
        categories.value = categoryResponseFromJson(data);
      } else {
        throw (Error.safeToString('Failed with fetch category'));
      }
      loading.value = false;
    } catch (error) {
      loading.value = false;
      rethrow;
    }
  }

  /// Effect hook to fetch categories when the component mounts.
  ///
  /// This effect runs once when the component mounts and calls [fetchCategories] to fetch the categories.
  useEffect(() {
    fetchCategories();
    return null;
  }, []);

  /// Returns a [CategoryHook] object containing the list of categories and the loading state.
  ///
  /// @returns [CategoryHook] containing the list of categories and the loading state.
  return CategoryHook(categories: categories.value, loading: loading.value);
}
