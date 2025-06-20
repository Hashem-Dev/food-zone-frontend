import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsRatingCount extends StatelessWidget {
  const RestaurantDetailsRatingCount({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String? ratingCount = restaurantController.restaurant?.ratingCount;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "$ratingCount" 'k+',
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Text(
            'Reviews',
            style: context.textStyle.displaySmall!.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
