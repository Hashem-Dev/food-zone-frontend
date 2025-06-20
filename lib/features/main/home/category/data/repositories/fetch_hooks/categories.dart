import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/models/category_hook.dart';
import 'package:food_zone/features/main/home/data/models/category_response.dart';
import 'package:http/http.dart' as http;

/// A hook that fetches and manages the state of categories data.
///
/// This hook is used to fetch categories data from the server and manage the
/// loading state. It provides a way to re-fetch the data when needed.
///
/// @returns [CategoriesHook] containing the categories data, loading state, and a re-fetch function.
CategoriesHook useCategoriesHook() {
  /// State to hold the list of categories.
  final categories = useState<List<CategoryResponse>?>(null);

  /// State to hold the loading status.
  final loading = useState<bool>(false);

  /// The URL to fetch categories data from.
  final Uri url = Uri.parse('$baseUrl/category/all');

  /// Fetches categories data from the server.
  ///
  /// This function makes an HTTP GET request to fetch the categories data.
  /// It updates the [categories] state with the fetched data and sets the
  /// [loading] state to false once the data is fetched.
  ///
  /// @throws Exception if the request fails.
  Future<void> fetchCategoriesData() async {
    loading.value = true;
    try {
      final http.Response response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final decodedBody = jsonDecode(response.body);
        categories.value =
            categoryResponseFromJson(jsonEncode(decodedBody['data']));
      } else {
        throw Exception('Failed with fetch categories');
      }
      loading.value = false;
    } catch (error) {
      rethrow;
    }
  }

  /// Effect hook to fetch categories data on component mount.
  ///
  /// This effect runs once when the component is mounted and fetches the
  /// categories data.
  useEffect(() {
    fetchCategoriesData();
    return;
  }, []);

  /// Re-fetches the categories data.
  ///
  /// This function sets the [loading] state to true and calls the
  /// [fetchCategoriesData] function to re-fetch the data.
  void reFetch() {
    loading.value = true;
    fetchCategoriesData();
  }

  return CategoriesHook(
    categories: categories.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}
