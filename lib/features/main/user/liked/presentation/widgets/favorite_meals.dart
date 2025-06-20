import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_product.dart';
import 'package:food_zone/features/main/user/liked/data/repositories/fetch_favorite_meals.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/list_favorite_shimmer.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/meal/favorite_meal_card.dart';

class FavoriteMeals extends HookWidget {
  const FavoriteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteMeals = useFavoriteMealsHook();
    final meals = favoriteMeals?.products?.meals.favoriteMeals;

    return (favoriteMeals == null || meals == null || favoriteMeals.loading)
        ? const ListFavoriteShimmer()
        : meals.isEmpty
            ? const Center(child: Text('Empty'))
            : AppRefreshIndicator(
                icon: SolarIconsBold.heart,
                refresh: () async => favoriteMeals.reFetch(),
                child: ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final FavoriteMealMeals meal = meals[index].meals;
                      return FavoriteMealCard(meal: meal);
                    }),
              );
  }
}
