import 'package:food_zone/core/global_widgets/shimmers/category.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/category/presentation/pages/categories.dart';
import 'package:food_zone/features/main/home/category/presentation/pages/category.dart';
import 'package:food_zone/features/main/home/category/presentation/widgets/category_card.dart';

import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/category.dart';

class HomeCategories extends HookWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryHook = useCategoryHook();
    final categoryData = categoryHook.categories;

    return SizedBox(
      height: context.heightByValue(200),
      width: context.widthByValue(345),
      child: categoryData == null
          ? const CategoryShimmer()
          : Center(
              //     color: Colors.red,
              //     alignment: Alignment.center,
              child: GridView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1,
                  mainAxisSpacing: 20.h,
                ),
                children: List.generate(
                  categoryData.length,
                  (index) {
                    final value = categoryData[index].value;
                    final icon = categoryData[index].icon;
                    final title = prefs.userLanguage == 'en'
                        ? categoryData[index].title.en
                        : categoryData[index].title.ar;
                    return GestureDetector(
                      onTap: () {
                        if (value == 'more') {
                          Get.to(() => const CategoriesView());
                          return;
                        }
                        Get.to(
                            () => CategoryView(category: categoryData[index]));
                      },
                      child: CategoryCard(icon: icon, title: title),
                    );
                  },
                ),
              ),
            ),
    );
  }
}
