import 'dart:ui';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';

class RestaurantHook {
  final Restaurant? restaurant;
  final VoidCallback reFetch;
  final bool loading;

  RestaurantHook({
    required this.restaurant,
    required this.reFetch,
    required this.loading,
  });
}
