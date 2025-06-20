import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealRatingCount extends StatelessWidget {
  const MealRatingCount({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final String? ratingCount = mealController.mealDetails?.ratingCount;
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
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
