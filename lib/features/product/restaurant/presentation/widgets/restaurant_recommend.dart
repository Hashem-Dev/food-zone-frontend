import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/widgets/meals_shimmer.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/random_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/popular_meals_card.dart';

class RestaurantRecommend extends HookWidget {
  const RestaurantRecommend({super.key});

  @override
  Widget build(BuildContext context) {
    final mealHook = useRandomMealsHook(size: 10);
    final meals = mealHook.randomMeals?.meals;
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
              return MealsCard(meal: meals[index]);
            },
          );
  }
}
