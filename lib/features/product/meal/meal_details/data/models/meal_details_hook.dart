import 'package:flutter/material.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';

class MealDetailsHook {
  final MealModel? mealDetails;
  final VoidCallback reFetch;

  MealDetailsHook({required this.mealDetails, required this.reFetch});
}
