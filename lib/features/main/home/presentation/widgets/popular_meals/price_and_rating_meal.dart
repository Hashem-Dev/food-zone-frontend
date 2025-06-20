import 'package:food_zone/exports.dart';

class RestaurantMealPrice extends StatelessWidget {
  const RestaurantMealPrice({
    super.key,
    this.rate,
    required this.price,
    required this.priceWithoutDiscount,
  });

  final double? rate;
  final double price;
  final double priceWithoutDiscount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        if (priceWithoutDiscount != 0)
          Text(
            '\$ $priceWithoutDiscount',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: neutral200,
              fontWeight: FontWeight.w400,
              fontSize: 15.sp,
            ),
          ),
        if (priceWithoutDiscount != 0)
          addHorizontalSpace(context.widthByValue(10)),
        Text(
          '\$ $price',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
            color: primary500,
          ),
        ),
      ],
    );
  }
}
