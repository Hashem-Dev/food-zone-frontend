import 'dart:ui';

import 'package:food_zone/features/product/product_rating/data/models/product_ratings.dart';

class ReviewsHooks {
  final List<ProductRating>? productRating;
  final VoidCallback reFetch;
  final bool loading;

  ReviewsHooks({
    required this.productRating,
    required this.reFetch,
    required this.loading,
  });
}
