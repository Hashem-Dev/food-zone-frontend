import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/widgets/meals_shimmer.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/random_meals.dart';
import 'package:food_zone/features/main/home/presentation/widgets/popular_meals/popular_meals_card.dart';

/// A widget that displays all popular meals using a grid layout.
///
/// This widget uses the `useRandomMealsHook` to fetch a list of random meals
/// and displays them in a grid. If the meals are still loading, a shimmer
/// effect is shown. The widget also includes a search bar and a refresh
/// indicator to reload the meals.
class AllPopularMeals extends HookWidget {
  /// Creates an instance of [AllPopularMeals].
  const AllPopularMeals({super.key});

  /// Builds the widget tree for [AllPopularMeals].
  ///
  /// @param context The build context.
  /// @returns A [Widget] tree.
  @override
  Widget build(BuildContext context) {
    final mealHook = useRandomMealsHook(size: 10);
    final meals = mealHook.randomMeals?.meals;

    return Scaffold(
      appBar: AppBar(
        title: const GradientAppbarTitle(title: 'Popular Meals'),
      ),
      body: ResponsiveLayout(
        portrait: SizedBox(
          height: context.height,
          width: context.width,
          child: (meals == null || mealHook.loading)
              ? const GridMealsShimmer()
              : AppRefreshIndicator(
                  icon: Icons.set_meal,
                  refresh: () async => mealHook.reFetch(),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          addVerticalSpace(context.heightByValue(100)),
                          Expanded(
                            child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              clipBehavior: Clip.none,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 25.h,
                                crossAxisSpacing: 10.w,
                                mainAxisExtent: context.heightByValue(200),
                              ),
                              itemCount: meals.length,
                              itemBuilder: (BuildContext context, index) {
                                return MealsCard(meal: meals[index]);
                              },
                            ),
                          ),
                        ],
                      ),
                      const AppSearchBar(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
