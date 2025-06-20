import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/data/models/review_request.dart';
import 'package:http/http.dart' as http;

class RatingBarController extends GetxController {
  final RxDouble _rating = 0.0.obs;
  final RxString _ratingType = ''.obs;
  final RxString _productTitle = ''.obs;
  final RxString _productId = ''.obs;
  final RxBool _loading = false.obs;
  final TextEditingController reviewTextController = TextEditingController();

  void setProductDetails({
    required String type,
    required String title,
    required String id,
  }) {
    _ratingType.value = type;
    _productTitle.value = title;
    _productId.value = id;
  }

  bool get loading => _loading.value;

  String get ratingType => _ratingType.value;

  String get productTitle => _productTitle.value;

  String get productId => _productId.value;

  double get rating => _rating.value;

  void changeRatingNumber(double rating) => _rating.value = rating;

  void changeLoadingState(bool state) => _loading.value = state;

  Future<bool> addProductRating({required List<String> images}) async {
    final Uri url = Uri.parse('$baseUrl/$ratingType/id/$productId');
    final reviewText = reviewTextController.text;

    final ReviewRequest reviewData = ReviewRequest(
      userRating: rating,
      review: reviewText,
      reviewImages: images,
    );
    final body = reviewRequestToJson(reviewData);

    try {
      final response =
          await http.patch(url, headers: prefs.authHeaders, body: body);

      if (response.statusCode == 200) {
        changeLoadingState(false);

        return true;
      } else {
        changeLoadingState(false);

        return false;
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  void dispose() {
    reviewTextController.dispose();
    super.dispose();
  }
}
