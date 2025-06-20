import 'package:food_zone/exports.dart';

class ItemPrice extends StatelessWidget {
  const ItemPrice({super.key, this.priceBeforeDiscount, required this.price});

  final double? priceBeforeDiscount;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (priceBeforeDiscount != null)
          Text(
            '\$ $priceBeforeDiscount',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: neutral200,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
            ),
          ),
        if (priceBeforeDiscount != null) addHorizontalSpace(8),
        Text(
          '\$ ${price.toStringAsFixed(2)}',
          style: TextStyle(
            color: primary500,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
        )
      ],
    );
  }
}
