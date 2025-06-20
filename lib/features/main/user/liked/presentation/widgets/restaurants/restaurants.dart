import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_restaurants.dart';
import 'package:food_zone/features/main/user/liked/data/repositories/fetch_favorite_restaurant.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/list_favorite_shimmer.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/restaurants/favorite_restaurants.dart';

class FavoriteRestaurants extends HookWidget {
  const FavoriteRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final data = useFavoriteRestaurantHook();
    final List<FavoriteRestaurant>? restaurants =
        data?.restaurants?.favoriteRestaurants;
    return (data == null || data.loading)
        ? const ListFavoriteShimmer()
        : AppRefreshIndicator(
            icon: SolarIconsBold.heart,
            refresh: () async => data.reFetch(),
            child: FavoriteRestaurantCards(restaurants: restaurants!),
          );
  }
}
