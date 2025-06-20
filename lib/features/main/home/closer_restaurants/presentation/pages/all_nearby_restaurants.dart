import 'package:food_zone/core/global_widgets/shimmers/random_restaurant.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/widgets/nearby_restaurant_card.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/random_restaurants.dart';

/// A widget that displays a list of nearby restaurants.
///
/// This widget uses a hook to fetch a list of nearby restaurants and displays
/// them in a list. If the data is still loading, it shows a shimmer effect.
///
/// The widget is responsive and adapts to different screen orientations.
class AllCloserRestaurants extends HookWidget {
  /// Creates an [AllCloserRestaurants] widget.
  const AllCloserRestaurants({super.key});

  /// Builds the widget tree for the [AllCloserRestaurants] widget.
  ///
  /// @param context The build context.
  /// @returns A [Widget] tree.
  @override
  Widget build(BuildContext context) {
    final hookData = useRestaurantsHook(size: 10);
    final List<Restaurant>? restaurants = hookData.restaurant;
    return Scaffold(
      appBar: AppBar(
        title: const GradientAppbarTitle(title: 'Nearby Restaurants'),
      ),
      body: ResponsiveLayout(
        portrait: (restaurants == null || hookData.loading)
            ? ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 7,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: EdgeInsetsDirectional.fromSTEB(0, 12.h, 0, 0),
                    child: const RandomRestaurantShimmer(),
                  );
                },
              )
            : AppRefreshIndicator(
                icon: Icons.restaurant_menu_rounded,
                refresh: () async => hookData.reFetch(),
                child: ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      margin: EdgeInsetsDirectional.fromSTEB(0, 12.h, 0, 0),
                      child: CloserRestaurantCard(
                        restaurant: restaurants[index],
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
