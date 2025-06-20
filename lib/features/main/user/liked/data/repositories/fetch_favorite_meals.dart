import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_meals_hook.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_product.dart';
import 'package:http/http.dart' as http;

FavoriteMealsHook? useFavoriteMealsHook() {
  final meals = useState<FavoriteProduct?>(null);
  final ValueNotifier loading = useState<bool>(false);
  Future<void> fetchFavoriteMeal() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/users/favorite?detailType=meals');

    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        meals.value = favoriteProductFromJson(response.body);
      } else {
        throw Exception('Failed with fetch favorite meals');
      }
      loading.value = false;
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchFavoriteMeal();
    return null;
  }, []);

  void reFetch() {
    loading.value = true;

    fetchFavoriteMeal();
  }

  return FavoriteMealsHook(
    products: meals.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}
