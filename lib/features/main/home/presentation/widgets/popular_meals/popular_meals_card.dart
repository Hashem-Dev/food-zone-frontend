import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/random_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/is_new_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/logo_and_title_restaurant.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/meal_cover.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/price_and_rating_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/title_and_time_meal.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';

class MealsCard extends StatelessWidget {
  const MealsCard({super.key, required this.meal});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final images = meal.images..shuffle();
    return GestureDetector(
      onTap: () {
        Get.to(() => MealDetails(mealId: meal.id));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: context.widthByValue(180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: meal.isNewMeal
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
                          child: MealLikeButton(id: meal.id),
                        )
                      ],
                    ),
                    TitleAndTimeMeal(
                      mealTitle: context.isEn ? meal.title.en : meal.title.ar,
                      mealTime: meal.time,
                    ),
                    RestaurantMealPrice(
                      price: meal.price,
                      priceWithoutDiscount: meal.priceWithoutDiscount,
                      rate: meal.rating.toDouble(),
                    ),
                    LogoAndTitleRestaurant(
                      logo: meal.restaurant.logo,
                      restaurantTitle: context.isEn
                          ? meal.restaurant.title.en
                          : meal.restaurant.title.ar,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (meal.isNewMeal)
            Positioned(bottom: -18.h, right: 5, child: const IsNewMeal())
        ],
      ),
    );
  }
}
