import 'package:food_zone/exports.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Tracking',
          style: context.textStyle.displaySmall!.copyWith(fontSize: 22.sp),
        ),
      ),
    );
  }
}
