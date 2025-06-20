import 'dart:ui';

import 'package:food_zone/features/main/user/liked/data/models/favorite_product.dart';

class FavoriteMealsHook {
  final FavoriteProduct? products;
  final VoidCallback reFetch;
  final bool loading;

  FavoriteMealsHook({
    required this.products,
    required this.reFetch,
    required this.loading,
  });
}
