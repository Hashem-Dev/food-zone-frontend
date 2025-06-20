import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/models/meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/is_new_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/logo_and_title_restaurant.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/meal_cover.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/price_and_rating_meal.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/title_and_time_meal.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';

/// A widget that displays a card for a category meal.
///
/// This widget shows the meal cover, like button, title, time, price, rating,
/// and restaurant information. It also navigates to the meal details page when tapped.
class CategoryMealCard extends StatelessWidget {
  /// Creates a [CategoryMealCard] widget.
  ///
  /// The [categoryMeal] parameter must not be null.
  const CategoryMealCard({super.key, required this.categoryMeal});

  /// The data of the category meal to be displayed.
  final CategoryMealsData categoryMeal;

  /// Builds the widget tree for the [CategoryMealCard].
  ///
  /// This method is called whenever the widget is rebuilt. It returns a [GestureDetector]
  /// that wraps a [Stack] containing the meal information.
  ///
  /// @param context The build context.
  /// @returns A [Widget] tree representing the category meal card.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => MealDetails(mealId: categoryMeal.id));
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 180.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: categoryMeal.isNewMeal
                  ? Border.all(width: 1, color: primary700)
                  : null,
            ),
            child: ContainerWithShadow(
              radius: 12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(children: [
                      MealCover(image: categoryMeal.images.first.url),
                      MealLikeButton(id: categoryMeal.id)
                    ]),
                    TitleAndTimeMeal(
                      mealTitle: context.language == 'en'
                          ? categoryMeal.title.en
                          : categoryMeal.title.ar,
                      mealTime: categoryMeal.time,
                    ),
                    RestaurantMealPrice(
                      priceWithoutDiscount: categoryMeal.priceWithoutDiscount,
                      price: categoryMeal.price,
                      rate: categoryMeal.rating.toDouble(),
                    ),
                    LogoAndTitleRestaurant(
                      logo: categoryMeal.restaurant.logo,
                      restaurantTitle: context.isEn
                          ? categoryMeal.restaurant.title.en
                          : categoryMeal.restaurant.title.ar,
                    )
                  ],
                ),
              ),
            ),
          ),
          if (categoryMeal.isNewMeal)
            Positioned(top: -18.h, child: const IsNewMeal())
        ],
      ),
    );
  }
}
