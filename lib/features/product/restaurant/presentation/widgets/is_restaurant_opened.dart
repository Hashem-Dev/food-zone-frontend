import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/manager/restaurant_time_converter.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/widgets/opened_restaurant.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class IsRestaurantOpened extends StatelessWidget {
  const IsRestaurantOpened({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String? time = restaurantController.restaurant?.time;
    return time == null
        ? const ShimmerContainer(width: 80, height: 18)
        : OpenedRestaurant(isOpened: isRestaurantOpened(time));
  }
}
