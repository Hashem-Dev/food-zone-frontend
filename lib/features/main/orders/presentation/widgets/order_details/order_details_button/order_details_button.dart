import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_details_button/order_pending_buttons.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_details_button/reorder_button.dart';

class OrderDetailsButtons extends StatelessWidget {
  const OrderDetailsButtons({super.key, required this.order});

  final OrderDetails order;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        height: context.heightByValue(77),
        width: context.widthByValue(375),
        decoration: BoxDecoration(
          color: context.isDarkMode ? neutral400 : primaryWhite,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff0D0A2C).withValues(alpha: .2),
              blurRadius: 20,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: (order.status == 'pending' || order.status == 'paid')
            ? const OrderPendingButtons()
            : const ReorderAllButton(),
      ),
    );
  }
}
