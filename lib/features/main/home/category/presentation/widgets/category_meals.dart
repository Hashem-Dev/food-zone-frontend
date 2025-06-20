import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/models/meal.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/widgets/meals_shimmer.dart';

import 'category_meal_card.dart';

/// A widget that displays a list of category meals in a grid format.
///
/// If the [meals] list is null, a shimmer effect is shown to indicate loading.
/// Otherwise, a grid of [CategoryMealCard] widgets is displayed.
///
/// This widget uses the [HookWidget] from the flutter_hooks package.
class CategoryMeals extends HookWidget {
  /// Creates a [CategoryMeals] widget.
  ///
  /// The [meals] parameter is optional and can be null.
  const CategoryMeals({super.key, this.meals});

  /// A list of category meals to be displayed.
  ///
  /// If null, a shimmer effect is shown instead.
  final List<CategoryMealsData>? meals;

  /// Builds the widget tree for the [CategoryMeals] widget.
  ///
  /// This method returns a [SizedBox] containing either a shimmer effect or a grid of [CategoryMealCard] widgets.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the [CategoryMeals] UI.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.h,
      width: context.w,
      child: meals == null
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
              ),
              itemCount: meals?.length ?? 0,
              itemBuilder: (BuildContext context, index) {
                return CategoryMealCard(categoryMeal: meals![index]);
              }),
    );
  }
}
