import 'package:flutter/material.dart';
import 'package:food_zone/core/global_widgets/section_title.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/pages/all_nearby_restaurants.dart';

class NearbyRestaurantTitle extends StatelessWidget {
  const NearbyRestaurantTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionTitle(
      title: 'Restaurant Closer To You',
      page: AllCloserRestaurants(),
    );
  }
}
