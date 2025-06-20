import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/pages/order_cancellation.dart';
import 'package:food_zone/features/main/orders/presentation/pages/order_tracking.dart';

class OrderPendingButtons extends StatelessWidget {
  const OrderPendingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic orderDetailsLogic = Get.find();
    return Obx(() {
      final trackOrder = orderDetailsLogic.orderStatus == 'paid';
      return Row(
        spacing: context.widthByValue(10),
        children: <Widget>[
          if (!trackOrder)
            Expanded(
              child: TextButton(
                onPressed: () => Get.to(() => const OrderCancellationView()),
                child: Text(
                  'Cancel Order',
                  style: TextStyle(
                    color: neutral200,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          Expanded(
            child: trackOrder
                ? FButton(
                    size: true,
                    title: 'Track Order',
                    onPressed: () => Get.to(() => const OrderTracking()),
                  )
                : FButton(
                    size: true,
                    title: 'Pay',
                    onPressed: () async {
                      await orderDetailsLogic.showReorderConfirmation(
                        context,
                        title: 'Payment Confirmation',
                        subtitle:
                            'Are you sure to continue in payment process?',
                        () async {
                          await orderDetailsLogic.checkout();
                        },
                      );
                    },
                  ),
          ),
        ],
      );
    });
  }
}
