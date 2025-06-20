import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_reviews/data/repositories/fetch_ratings_details.dart';

class ReviewRatingBar extends HookWidget {
  const ReviewRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();
    final productId = mealDetailsController.mealDetails?.id;
    final ratingData = useRatingDetailsHook(
      productId: productId!,
      productType: 'meal',
    );
    final rating = ratingData?.productRatingDetails;

    return SizedBox(
      width: context.w * .491094,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ...List.generate(
            5,
            (index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    '${-(index - 5)}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: context.w * 0.43765,
                    height: context.h * 0.00704,
                    child: rating == null
                        ? ShimmerContainer(width: context.width, height: 15)
                        : LinearProgressIndicator(
                            value: ((rating.ratings[-(index - 4)].count) / 100)
                                .toDouble(),
                            borderRadius: BorderRadius.circular(12.r),
                            color: primary500,
                            backgroundColor: neutral50,
                          ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
