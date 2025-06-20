import 'package:flutter/material.dart';
import 'package:food_zone/features/product/product_rating/data/models/product_rating_details.dart';

class RatingDetailsHook {
  final ProductRatingDetails? productRatingDetails;
  final VoidCallback reFetch;
  final bool loading;

  RatingDetailsHook({
    required this.productRatingDetails,
    required this.reFetch,
    required this.loading,
  });
}
