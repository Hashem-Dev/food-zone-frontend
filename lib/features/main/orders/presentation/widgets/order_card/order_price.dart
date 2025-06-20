import 'package:food_zone/exports.dart';

class OrderPrice extends StatelessWidget {
  const OrderPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      r'$' ' ${price.toStringAsFixed(2)}',
      style: TextStyle(
        color: primary500,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
    );
  }
}
