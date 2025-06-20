import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final rating = restaurantController.restaurant!.rating;
    final ratingCount = restaurantController.restaurant!.ratingCount;
    return SizedBox(
      width: context.w * 0.35623,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$rating',
            style: context.textStyle.displaySmall!.copyWith(fontSize: 40.sp),
          ),
          RatingBarIndicator(
              rating: 3,
              unratedColor: secondary500.withValues(alpha: 0.15),
              itemCount: 5,
              itemSize: 20.sp,
              itemBuilder: (_, index) {
                return const Icon(Icons.star_rounded, color: secondary500);
              }),
          Text(
            '($ratingCount)',
            style: TextStyle(
              fontSize: 16.sp,
              color: neutral300,
            ),
          )
        ],
      ),
    );
  }
}
