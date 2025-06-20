import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_card/order_status.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'Order Summery',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: primaryWhite,
            borderRadius: BorderRadius.circular(56.r),
            border: Border.all(width: 1, color: neutral100),
          ),
          child: Text(
            status.capitalize!,
            style: TextStyle(
              color: orderStatusColor(status, context.isDarkMode),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
