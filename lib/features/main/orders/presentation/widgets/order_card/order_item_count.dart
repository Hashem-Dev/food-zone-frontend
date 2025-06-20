import 'package:food_zone/exports.dart';

class OrderItemCount extends StatelessWidget {
  const OrderItemCount({super.key, required this.itemCount});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Text(
      itemCount > 1 ? '$itemCount Items' : '1 Item',
      style: context.textStyle.displaySmall,
    );
  }
}
