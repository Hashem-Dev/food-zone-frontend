import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/random_restaurants.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/random_restaurant_list_shimmer.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_card.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookData = useRestaurantsHook();
    final List<Restaurant>? restaurants = hookData.restaurant;

    return SizedBox(
      height: context.heightByValue(200),
      child: restaurants == null
          ? const RandomRestaurantListShimmer()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              itemBuilder: (BuildContext context, index) => Container(
                margin: EdgeInsetsDirectional.fromSTEB(0, 0, 12.w, 12.h),
                child: RestaurantCard(restaurant: restaurants[index]),
              ),
            ),
    );
  }
}
