import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details_hook.dart';
import 'package:http/http.dart' as http;

MealDetailsHook? useMealDetailsHook(String mealId) {
  final meal = useState<MealModel?>(null);
  final Uri url = Uri.parse('$baseUrl/meal/id/$mealId');

  Future<void> fetchMealData() async {
    try {
      final http.Response response =
          await http.get(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        meal.value = mealModelFromJson(response.body);
      } else {
        throw Exception('Failed with fetching detail meal');
      }
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    Future.microtask(() {
      fetchMealData();
    });

    return;
  }, []);

  void reFetch() => fetchMealData();

  return MealDetailsHook(mealDetails: meal.value, reFetch: reFetch);
}
