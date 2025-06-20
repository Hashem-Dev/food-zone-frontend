import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/repositories/fetch_hooks/meals.dart';
import 'package:food_zone/features/main/home/category/presentation/widgets/category_appbar.dart';
import 'package:food_zone/features/main/home/category/presentation/widgets/category_meals.dart';
import 'package:food_zone/features/main/home/data/models/category_response.dart';

/// A view that displays the meals for a specific category.
///
/// This widget uses the [HookWidget] to manage the state of the meals
/// fetched for the given category. It displays an app bar with the
/// category title and icon, a search bar, and a list of meals.
///
/// {@tool snippet}
/// ```dart
/// CategoryView(category: someCategoryResponse);
/// ```
/// {@end-tool}
class CategoryView extends HookWidget {
  /// Creates a [CategoryView] with the given [category].
  ///
  /// The [category] parameter must not be null.
  const CategoryView({super.key, required this.category});

  /// The category for which the meals are displayed.
  final CategoryResponse category;

  @override
  Widget build(BuildContext context) {
    /// Fetches the meals for the given category using a custom hook.
    final categoryMealData = useCategoryMealsHook(category.id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CategoryAppbarTitle(icon: category.icon, title: category.title),
      ),
      body: ResponsiveLayout(
        portrait: SingleChildScrollView(
          child: Column(
            children: [
              addVerticalSpace(16),
              const AppSearchBar(),
              addVerticalSpace(24),
              CategoryMeals(meals: categoryMealData),
            ],
          ),
        ),
      ),
    );
  }
}
