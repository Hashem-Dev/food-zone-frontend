import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_logo.dart';

class ItemRestaurant extends StatelessWidget {
  const ItemRestaurant({super.key, required this.logo, required this.title});

  final String logo;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: context.widthByValue(5),
      children: <Widget>[
        RestaurantLogo(logo: logo, width: 16),
        Text(
          title,
          style: TextStyle(
            color: context.textStyle.displayLarge!.color,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
