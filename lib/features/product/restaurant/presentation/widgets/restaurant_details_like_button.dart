import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_like_button.dart';

class RestaurantDetailsLikeButton extends StatelessWidget {
  const RestaurantDetailsLikeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0.w,
        vertical: 8.h,
      ),
      child: const RestaurantLikeButton(
        width: 42,
        iconSize: 26,
        restaurantId: '',
      ),
    );
  }
}
