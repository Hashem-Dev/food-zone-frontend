import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_tab_bar.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_tab_bar/restaurant_details_tab_bar_template.dart';

class RestaurantDetailsTabBar extends StatelessWidget {
  const RestaurantDetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final tabController = Get.put(RestaurantTabBarController());
    final String title = restaurantController.getRestaurantTitleForLanguage();
    return SizedBox(
      width: context.w,
      height: context.h * 0.05869,
      child: TabBar(
        onTap: (index) {
          tabController.changeTabBarIndex(index);
        },
        tabs: [
          RestaurantDetailsTabBarTemplate(
            index: 0,
            text: '$title Menu',
          ),
          const RestaurantDetailsTabBarTemplate(
            index: 1,
            text: 'Recommended',
          ),
        ],
      ),
    );
  }
}
