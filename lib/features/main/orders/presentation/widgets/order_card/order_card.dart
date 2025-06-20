import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/orders.dart';
import 'package:food_zone/features/main/orders/presentation/pages/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_id.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_images_card.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_item_count.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_price.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_status.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final OrdersResponse order;

  @override
  Widget build(BuildContext context) {
    final int orderItemCount = order.orderImages.length;
    return GestureDetector(
      onTap: () {
        Get.to(() => OrderDetailsView(orderId: order.id));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        width: context.widthByValue(345),
        height: context.heightByValue(91),
        child: ContainerWithShadow(
          radius: 12,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(child: OrderImagesCard(images: order.orderImages)),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OrderId(orderId: order.orderNumber),
                      OrderPrice(price: order.totalPrice),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          OrderItemCount(itemCount: orderItemCount),
                          OrderStatus(status: order.status),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
