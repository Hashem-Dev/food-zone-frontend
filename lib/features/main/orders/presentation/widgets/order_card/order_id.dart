import 'package:food_zone/exports.dart';

class OrderId extends StatelessWidget {
  const OrderId({super.key, required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text.rich(
        maxLines: 1,
        overflow: TextOverflow.clip,
        softWrap: false,
        TextSpan(
          children: <InlineSpan>[
            TextSpan(
              text: 'Order ID: ',
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: orderId,
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
