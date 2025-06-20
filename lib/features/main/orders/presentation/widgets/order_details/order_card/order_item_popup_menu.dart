import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';
import 'package:food_zone/features/product/restaurant/presentation/pages/restaurant_details.dart';

class OrderItemPopupMenu extends StatelessWidget {
  const OrderItemPopupMenu({
    super.key,
    required this.meal,
    required this.restaurant,
  });

  final String meal;
  final String restaurant;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      color: context.background,
      menuPadding: EdgeInsets.symmetric(horizontal: 6.w),
      child: const Icon(SolarIconsOutline.menuDots),
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem>[
          PopupMenuItem(
            child: const Text('View Meal'),
            onTap: () {
              Get.to(() => MealDetails(mealId: meal));
            },
          ),
          PopupMenuItem(
            child: const Text('View Restaurant'),
            onTap: () {
              Get.to(() => RestaurantDetails(restaurantId: restaurant));
            },
          ),
          const PopupMenuItem(child: Text('Report'))
        ];
      },
    );
  }
}
