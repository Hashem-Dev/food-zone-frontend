import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_reviews/data/repositories/fetch_ratings_details.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/review_card.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/no_reviews_template.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/reviews_list_shimmer.dart';

class AllReviews extends HookWidget {
  const AllReviews({
    super.key,
    this.isPositive,
    this.rating,
    this.page = 1,
    this.limit = '',
  });

  final bool? isPositive;
  final int? rating;
  final int page;
  final String limit;

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController = Get.find();
    final mealId = mealController.mealDetails?.id ?? '';
    final ratingsData = useRatingsDetailsHook(
      id: mealId,
      product: 'meal',
      isPositive: isPositive,
      page: page,
      limit: limit,
      rating: '$rating',
    );
    final ratings = ratingsData?.productRating;

    return (ratings == null)
        ? const ReviewsListShimmer()
        : SizedBox(
            height: context.height,
            child: ratings.isEmpty
                ? NoReviewsTemplate(
                    id: mealId,
                    type: 'meal',
                    title: mealController.getMealTitleForLanguage(),
                  )
                : AppRefreshIndicator(
                    icon: Icons.star_rounded,
                    refresh: () async {
                      ratingsData?.reFetch();
                    },
                    child: ListView.builder(
                        itemCount: ratings.length,
                        itemBuilder: (context, index) {
                          return ReviewCard(productRating: ratings[index]);
                        }),
                  ),
          );
  }
}
