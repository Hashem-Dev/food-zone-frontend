import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealRatingStars extends StatelessWidget {
  const MealRatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final rating = mealController.mealDetails?.rating;
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
              if (rating != null)
                Text(
                  rating.toStringAsFixed(1),
                  style: context.textStyle.displaySmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
            ],
          ),
          Text(
            'Rating',
            style: context.textStyle.displaySmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
