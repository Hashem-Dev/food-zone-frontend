import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/core/global_widgets/section_title.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/pages/closer_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/category/categories.dart';
import 'package:food_zone/features/main/home/presentation/widgets/closer_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_offer.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/nearby_restaurant_title.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/nearby_restaurants.dart';
import 'package:food_zone/features/main/home/presentation/widgets/offers/offers.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/popular_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/special_offers_title.dart';
import 'package:food_zone/features/main/presentation/pages/main_screen.dart';

class PortraitHomeView extends StatelessWidget {
  const PortraitHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRefreshIndicator(
      icon: SolarIconsOutline.home,
      refresh: () {
        return Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => const MainScreen(),
          ),
        );
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.heightByValue(10),
          children: <Widget>[
            const HomeOffers(),
            const AppSearchBar(),
            const HomeCategories(),
            const SpecialOffersTitle(),
            const MealOffer(),
            const SizedBox.shrink(),
            const SectionTitle(title: 'Popular Meals', page: AllPopularMeals()),
            const PopularMeals(),
            const SizedBox.shrink(),
            const NearbyRestaurantTitle(),
            const NearbyRestaurants(),
            const SectionTitle(
              title: 'Meals Closer To You',
              page: AllPopularMeals(),
            ),
            const CloserMeals(),
            addVerticalSpace(100),
          ],
        ),
      ),
    );
  }
}
