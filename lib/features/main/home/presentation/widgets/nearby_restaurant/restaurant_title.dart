import 'package:food_zone/exports.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
