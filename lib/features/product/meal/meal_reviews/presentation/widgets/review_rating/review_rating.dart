import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();
    final rating = mealDetailsController.mealDetails?.rating;
    final ratingCount = mealDetailsController.mealDetails?.ratingCount;
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
            itemCount: 5,
            itemSize: 20.sp,
            rating: rating ?? 0,
            itemBuilder: (context, index) => const Icon(
              Icons.star_rate_rounded,
              color: secondary500,
            ),
          ),
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
