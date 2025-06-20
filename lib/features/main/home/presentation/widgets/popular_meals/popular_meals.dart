import 'package:food_zone/core/global_widgets/shimmers/meal.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/random_meals.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/random_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/popular_meals_card.dart';

class PopularMeals extends HookWidget {
  const PopularMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final mealHook = useRandomMealsHook();
    final List<Meal>? meals = mealHook.randomMeals?.meals;
    return SizedBox(
      height: context.heightByValue(200),
      child: meals == null
          ? const MealShimmer()
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: meals.length,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 15.w, 0),
                  child: MealsCard(meal: meals[index]),
                );
              }),
    );
  }
}
