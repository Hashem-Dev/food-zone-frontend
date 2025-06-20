import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/repositories/fetch_user_orders.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_card.dart';

class OrderBarView extends HookWidget {
  const OrderBarView({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final ordersHook = useUserOrdersHook(status: status);
    final orders = ordersHook?.userOrders;

    return orders == null
        ? const Text('loading')
        : SizedBox(
            child: orders.isEmpty
                ? Center(
                    child: Text(
                      'No orders for this at now.',
                      style: context.textStyle.displayLarge!.copyWith(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : AppRefreshIndicator(
                    refresh: () async {
                      ordersHook!.reFetch();
                    },
                    icon: Icons.fastfood_rounded,
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return OrderCard(order: orders[index]);
                      },
                    ),
                  ),
          );
  }
}
