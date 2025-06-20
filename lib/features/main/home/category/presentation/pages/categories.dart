import 'package:food_zone/core/global_widgets/shimmers/category.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/data/repositories/fetch_hooks/categories.dart';
import 'package:food_zone/features/main/home/category/presentation/pages/category.dart';
import 'package:food_zone/features/main/home/category/presentation/widgets/category_card.dart';

/// A view that displays a list of categories in a grid format.
///
/// This widget uses the `useCategoriesHook` to fetch the categories data and
/// displays them in a grid. If the data is loading or null, it shows a shimmer
/// effect. Otherwise, it displays the categories in a grid with a refresh indicator.
class CategoriesView extends HookWidget {
  /// Creates a [CategoriesView] widget.
  const CategoriesView({super.key});

  /// Builds the widget tree for the [CategoriesView].
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree that represents the categories view.
  @override
  Widget build(BuildContext context) {
    final hookData = useCategoriesHook();
    final categories = hookData.categories;
    return Scaffold(
      appBar: AppBar(
        title: const GradientAppbarTitle(title: 'Categories'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        height: context.h,
        child: (categories == null || hookData.loading)
            ? const CategoryShimmer(generate: 9)
            : AppRefreshIndicator(
                icon: SolarIconsBold.widget_5,
                refresh: () async => hookData.reFetch(),
                child: GridView(
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 24.w,
                  ),
                  children: List.generate(categories.length, (index) {
                    final icon = categories[index].icon;
                    final title = context.isEn
                        ? categories[index].title.en
                        : categories[index].title.ar;
                    return GestureDetector(
                      onTap: () => Get.to(
                        () => CategoryView(category: categories[index]),
                      ),
                      child: CategoryCard(icon: icon, title: title),
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
