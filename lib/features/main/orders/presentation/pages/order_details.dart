import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/data/repositories/fetch_order_details.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/delivery_instruction_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_cancel_reason.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_content.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_details_button/order_details_button.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_details_button/order_review/order_review.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_rating.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_summery.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/payment_summery.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/order_location.dart';
import 'package:intl/intl.dart';

class OrderDetailsView extends HookWidget {
  const OrderDetailsView({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    final hookData = useOrderDetailsHook(orderId);
    final order = hookData.orderDetails;

    final logic = Get.put(OrderDetailsLogic());

    if (order != null && order.status == 'delivered') {
      final controllers = useMemoized(
          () => List.generate(
              order.items.length, (index) => TextEditingController()),
          [order.items.length]);
      logic.reviewTextControllers = controllers;
    }

    logic.orderStatus = order?.status ?? '';
    logic.orderAddress = order?.shippingAddress.id ?? '';
    logic.orderDetails = order;
    logic.deliveryInstruction = order?.deliveryInstruction ?? '';
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(
              'Order Details',
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: order == null
              ? const Text('Null')
              : ResponsiveLayout(
                  portrait: SingleChildScrollView(
                    child: Column(
                      spacing: context.heightByValue(16),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        OrderSummery(status: order.status),
                        ...buildOrderItem(order.items),
                        PaymentSummery(order: order),
                        buildOrderLocation(order),
                        ...buildListPromotion(order.promotions),
                        OrderDeliveryInstruction(
                          instruction: order.deliveryInstruction,
                        ),
                        OrderDateCreation(
                          date: DateFormat('yyyy-MM-dd hh:MM')
                              .format(order.createdAt),
                        ),
                        if (order.status == 'delivered') const OrderRating(),
                        if (order.status == 'delivered')
                          OrderReview(order: orderId),
                        if (order.status == 'canceled')
                          OrderCancellationReason(
                            reason: order.cancellationReason,
                          ),
                        addVerticalSpace(100),
                      ],
                    ),
                  ),
                ),
        ),
        if (order != null)
          Positioned(
            bottom: context.heightByValue(14),
            right: context.widthByValue(9),
            left: context.widthByValue(9),
            child: OrderDetailsButtons(order: order),
          ),
        Obx(() {
          final loading = logic.reorderLoading;
          if (loading) {
            return const PageLoading();
          } else {
            return const SizedBox.shrink();
          }
        })
      ],
    );
  }

  OrderLocation buildOrderLocation(OrderDetails order) {
    return OrderLocation(
      withDetail: true,
      orderTitleLocation: order.shippingAddress.addressTitle,
      orderLocation:
          '${order.shippingAddress.country}, ${order.shippingAddress.city},${order.shippingAddress.additionalInfo}',
    );
  }
}

class OrderDateCreation extends StatelessWidget {
  const OrderDateCreation({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthByValue(345),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              'Order Creation Date',
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: FittedBox(
              child: Text(
                date,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
