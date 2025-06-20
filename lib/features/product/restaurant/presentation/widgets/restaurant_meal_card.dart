import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/is_new_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/logo_and_title_restaurant.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/meal_cover.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/price_and_rating_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/title_and_time_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';
import 'package:food_zone/features/product/restaurant/data/models/restaurant_meals.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantMealCard extends StatelessWidget {
  const RestaurantMealCard({
    super.key,
    required this.restaurantMeal,
    this.reset = false,
  });

  final bool reset;
  final RestaurantMeals restaurantMeal;

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final images = restaurantMeal.images..shuffle();

    return GestureDetector(
      onTap: () {
        Get.to(
          () => MealDetails(mealId: restaurantMeal.id),
          preventDuplicates: true,
        );
        if (reset) {
          Get.delete<MealDetailsController>();
          Get.delete<MealCountController>();
          Get.delete<BasketItemsController>();
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.widthByValue(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: restaurantMeal.isNewMeal
                  ? Border.all(width: 1, color: primary700)
                  : null,
            ),
            child: ContainerWithShadow(
              radius: 12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: <Widget>[
                        MealCover(image: images.first.url),
                        Align(
                            alignment: Alignment.topRight,
                            child: MealLikeButton(id: restaurantMeal.id))
                      ],
                    ),
                    const Spacer(),
                    TitleAndTimeMeal(
                      mealTitle: context.language == 'en'
                          ? restaurantMeal.title.en
                          : restaurantMeal.title.ar,
                      mealTime: restaurantMeal.time,
                    ),
                    const Spacer(),
                    RestaurantMealPrice(
                      priceWithoutDiscount: restaurantMeal.priceWithoutDiscount,
                      price: restaurantMeal.price,
                    ),
                    const Spacer(flex: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LogoAndTitleRestaurant(
                          logo: restaurantController.restaurant!.logo,
                          restaurantTitle: restaurantController
                              .getRestaurantTitleForLanguage(),
                        ),
                        ProductRating(rate: restaurantMeal.rating),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          if (restaurantMeal.isNewMeal)
            Positioned(top: -18.h, child: const IsNewMeal())
        ],
      ),
    );
  }
}
