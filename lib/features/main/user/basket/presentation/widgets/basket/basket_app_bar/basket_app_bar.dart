import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/add_items_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/app_bar_title.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/order_summary_text.dart';

AppBar basketViewAppBar(BuildContext context) {
  return AppBar(
    title: const AppBarTitle(),
    bottom: PreferredSize(
      preferredSize: Size(context.width, 35.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(child: OrderSummaryText()),
            AddItemsButton(),
          ],
        ),
      ),
    ),
  );
}
