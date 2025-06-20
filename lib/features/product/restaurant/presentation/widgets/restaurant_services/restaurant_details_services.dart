import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_services/restaurant_service.dart';

class RestaurantDetailsServices extends StatelessWidget {
  const RestaurantDetailsServices({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final bool pickup = restaurantController.restaurant!.pickup;
    final bool delivery = restaurantController.restaurant!.delivery;
    return Row(
      children: [
        RestaurantService(
          serviceName: 'Pickup',
          service: pickup,
          icon: SolarIconsBold.cart_5,
        ),
        addHorizontalSpace(16),
        RestaurantService(
          serviceName: 'Delivery',
          service: delivery,
          icon: SolarIconsBold.scooter,
        ),
      ],
    );
  }
}
