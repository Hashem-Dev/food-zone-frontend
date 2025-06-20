import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/manager/tab_bar.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/widgets/review_tab_bar/tab_template.dart';

class OrderTabBar extends StatelessWidget {
  const OrderTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TabBarLogic tabLogic = Get.find();
    return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.center,
      onTap: (index) {
        tabLogic.changeIndexSelection(index);
      },
      tabs: <Widget>[
        const TabTemplate(index: 0, text: 'All'),
        const TabTemplate(index: 1, text: 'Pending'),
        const TabTemplate(index: 2, text: 'Paid'),
        const TabTemplate(index: 3, text: 'Delivered'),
        const TabTemplate(index: 4, text: 'Canceled'),
      ],
    );
  }
}
