import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

import 'package:food_zone/features/product/restaurant/presentation/pages/restaurant_details.dart';

class OpenRestaurantButton extends StatelessWidget {
  const OpenRestaurantButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final String restaurantId = mealController.mealDetails!.restaurant.id;
    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantDetails(restaurantId: restaurantId));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
        decoration: BoxDecoration(
          color: primary500,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: const Text(
          'Open Restaurant',
          style: TextStyle(fontWeight: FontWeight.w500, color: primaryWhite),
        ),
      ),
    );
  }
}
