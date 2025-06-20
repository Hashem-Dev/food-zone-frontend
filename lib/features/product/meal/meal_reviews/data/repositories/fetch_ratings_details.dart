import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/data/models/reviews_details.dart';
import 'package:food_zone/features/product/meal/meal_reviews/data/models/reviews_hooks.dart';
import 'package:food_zone/features/product/product_rating/data/models/product_rating_details.dart';
import 'package:food_zone/features/product/product_rating/data/models/product_ratings.dart';
import 'package:http/http.dart' as http;

ReviewsHooks? useRatingsDetailsHook({
  String? id,
  bool? isPositive,
  String rating = '',
  String? product,
  int page = 1,
  String limit = '',
}) {
  final reviewsDetails = useState<List<ProductRating>?>(null);
  final loading = useState<bool>(false);
  final Uri url = Uri.parse(
      '$baseUrl/reviews/?productId=$id&${isPositive == null ? '' : 'isPositive=$isPositive'}&rating=${rating == 'null' ? '' : rating}&product=$product&page=$page&limit=$limit');

  Future<void> fetchRatingsData() async {
    loading.value == true;
    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        reviewsDetails.value = productRatingFromJson(response.body);
      } else {
        throw Exception('Failed with fetch ratings data');
      }
      loading.value == true;
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchRatingsData();
    return;
  }, []);

  void reFetch() {
    loading.value == true;
    fetchRatingsData();
  }

  return ReviewsHooks(
    productRating: reviewsDetails.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}

RatingDetailsHook? useRatingDetailsHook({
  required String productId,
  required String productType,
}) {
  final ratingDetails = useState<ProductRatingDetails?>(null);
  final loading = useState<bool>(false);

  final Uri url = Uri.parse(
    '$baseUrl/reviews/product-details/?productId=$productId&productType=$productType',
  );

  Future<void> fetchRatingDetails() async {
    loading.value = true;
    try {
      final response = await http.get(url, headers: prefs.authHeaders);

      if (response.statusCode == 200) {
        ratingDetails.value = productRatingDetailsFromJson(response.body);
      } else {
        throw Exception('Failed with fetch rating details $productType');
      }
      loading.value = true;
    } catch (error) {
      rethrow;
    }
  }

  useEffect(() {
    fetchRatingDetails();
    return;
  }, []);

  reFetch() {
    fetchRatingDetails();
  }

  return RatingDetailsHook(
    productRatingDetails: ratingDetails.value,
    reFetch: reFetch,
    loading: loading.value,
  );
}
