import 'package:food_zone/exports.dart';

class FavoriteMealPrice extends StatelessWidget {
  const FavoriteMealPrice({super.key, required this.price});

  final double price;

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$ $price',
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w800,
        color: primary500,
      ),
    );
  }
}
