import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsTitle extends StatelessWidget {
  const RestaurantDetailsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String title = restaurantController.getRestaurantTitleForLanguage();
    return Text(
      title,
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: primaryWhite,
      ),
    );
  }
}
