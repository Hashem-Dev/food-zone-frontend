import 'package:food_zone/exports.dart';

class MealRestaurantTitle extends StatelessWidget {
  const MealRestaurantTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w800,
        color: primary500,
      ),
    );
  }
}
