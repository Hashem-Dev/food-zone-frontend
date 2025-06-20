import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/widgets/meals_shimmer.dart';
import 'package:food_zone/features/product/restaurant/data/repositories/fetch_restaurant_meals.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_meal_card.dart';

class RestaurantMenu extends HookWidget {
  const RestaurantMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantDataController restaurantController = Get.find();
    final restaurantMeals =
        useRestaurantMealsHook(restaurantController.restaurant?.id);

    final meals = restaurantMeals;
    return meals == null
        ? const GridMealsShimmer()
        : GridView.builder(
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 25.h,
              crossAxisSpacing: 10.w,
              mainAxisExtent: context.heightByValue(200),
            ),
            itemCount: meals.length,
            itemBuilder: (BuildContext context, index) {
              return Center(
                child: RestaurantMealCard(
                  reset: true,
                  restaurantMeal: meals[index],
                ),
              );
            });
  }
}
