import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

import 'package:food_zone/features/product/meal/meal_reviews/presentation/pages/reviews_view.dart';

class AllMealReviewsButton extends StatelessWidget {
  const AllMealReviewsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final mealId = mealController.mealDetails?.id;
    return mealId == null
        ? ShimmerContainer(width: 100.w, height: 30.h)
        : GestureDetector(
            onTap: () {
              Get.to(() {
                return ReviewsView(mealId: mealId);
              });
            },
            child: Text(
              'See all Reviews',
              style: TextStyle(
                color: neutral300,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                decorationStyle: TextDecorationStyle.wavy,
                decoration: TextDecoration.underline,
              ),
            ),
          );
  }
}
