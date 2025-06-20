import 'package:food_zone/exports.dart';

class OrderSummaryText extends StatelessWidget {
  const OrderSummaryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Order Summary',
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
