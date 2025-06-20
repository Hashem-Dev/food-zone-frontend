import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_bar_content.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_redirect.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_tab_bar.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/manager/tab_bar.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => TabBarLogic());
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Orders',
            style: context.textStyle.displaySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        body: prefs.refreshToken.isEmpty
            ? const OrderRedirect()
            : ResponsiveLayout(
                portrait: Column(
                  spacing: context.heightByValue(12),
                  children: <Widget>[
                    const AppSearchBar(),
                    const OrderTabBar(),
                    const Expanded(child: OrderBarContent()),
                  ],
                ),
              ),
      ),
    );
  }
}
