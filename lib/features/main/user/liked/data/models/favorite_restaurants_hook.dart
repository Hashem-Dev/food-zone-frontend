import 'dart:ui';

import 'package:food_zone/features/main/user/liked/data/models/favorite_restaurants.dart';

class FavoriteRestaurantsHook {
  final Restaurants? restaurants;
  final VoidCallback reFetch;
  final bool loading;

  FavoriteRestaurantsHook({
    required this.restaurants,
    required this.reFetch,
    required this.loading,
  });
}
