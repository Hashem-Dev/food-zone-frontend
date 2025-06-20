import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsRatingStars extends StatelessWidget {
  const RestaurantDetailsRatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final double? rating = restaurantController.restaurant?.rating;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Icons.star_rounded,
                color: secondary500,
                size: 20.sp,
              ),
              addHorizontalSpace(3),
              Text(
                "${rating!.floorToDouble()}",
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          Text(
            'Rating',
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
