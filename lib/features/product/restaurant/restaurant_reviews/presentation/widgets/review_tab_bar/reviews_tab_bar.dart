import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/manager/tab_bar.dart';

import 'tab_template.dart';

class RestaurantReviewsTabBar extends StatelessWidget {
  const RestaurantReviewsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final tabBarController = Get.put(TabBarLogic());
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.zero,
      tabAlignment: TabAlignment.start,
      splashBorderRadius: BorderRadius.circular(8.r),
      onTap: (index) {
        tabBarController.changeIndexSelection(index);
      },
      indicatorPadding: EdgeInsets.zero,
      tabs: [
        const TabTemplate(index: 0, text: 'All'),
        const TabTemplate(index: 1, text: 'Positive'),
        const TabTemplate(index: 2, text: 'Negative'),
        ...List.generate(
          5,
          (index) {
            return TabTemplate(
              index: index + 3,
              text: '${-(index - 5)}',
              withStar: true,
            );
          },
        ),
      ],
    );
  }
}
