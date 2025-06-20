import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';

class PaymentSummery extends StatelessWidget {
  const PaymentSummery({super.key, required this.order});

  final OrderDetails order;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightByValue(167),
      width: context.widthByValue(345),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: context.isDarkMode ? neutral600 : primaryWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1, color: neutral100),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Payment Summery',
            style: context.textStyle.titleLarge!.copyWith(fontSize: 16.sp),
          ),
          buildDetailPaymentSummery(
            'Total Item (${order.items.length})',
            order.totalPrice.toStringAsFixed(2),
          ),
          buildDetailPaymentSummery('Delivery Fee', '${order.shippingCost}'),
          buildDetailPaymentSummery(
            'Discount',
            order.discount.toStringAsFixed(2),
          ),
        ],
      ),
    );
  }

  Row buildDetailPaymentSummery(String title, String value) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Text(
            title,
            style: TextStyle(
              color: neutral200,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            textAlign: TextAlign.start,
            '\$ $value',
            style: TextStyle(
              color: primary500,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
