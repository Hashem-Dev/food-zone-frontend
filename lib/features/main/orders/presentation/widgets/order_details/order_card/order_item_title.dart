import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';

class OrderItemTitle extends StatelessWidget {
  const OrderItemTitle({super.key, required this.title});

  final MealTitle title;

  @override
  Widget build(BuildContext context) {
    return Text(
      context.isEn ? title.en : title.ar,
      style: context.textStyle.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12.sp,
      ),
    );
  }
}
