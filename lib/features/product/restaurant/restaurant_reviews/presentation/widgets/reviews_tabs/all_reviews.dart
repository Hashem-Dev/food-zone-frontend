import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/data/repositories/fetch_ratings_details.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/review_card.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/no_reviews_template.dart';
import 'package:food_zone/features/product/product_rating/presentation/widgets/reviews_list_shimmer.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RAllReviews extends HookWidget {
  const RAllReviews(
    this.id, {
    super.key,
    this.isPositive,
    this.rating,
    this.page = 1,
    this.limit = '',
  });

  final String id;
  final bool? isPositive;
  final int? rating;
  final int page;
  final String limit;

  @override
  Widget build(BuildContext context) {
    final RestaurantDataController restaurantDataController = Get.find();

    final ratingsData = useRatingsDetailsHook(
      id: id,
      product: 'restaurant',
      isPositive: isPositive,
      page: page,
      limit: limit,
      rating: '$rating',
    );

    final ratings = ratingsData?.productRating;

    return ratings == null
        ? const ReviewsListShimmer()
        : SizedBox(
            height: context.height,
            child: ratings.isEmpty
                ? NoReviewsTemplate(
                    id: id,
                    type: 'restaurant',
                    title: restaurantDataController
                        .getRestaurantTitleForLanguage(),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: ratings.length,
                    itemBuilder: (context, index) {
                      final productRating = ratings[index];
                      return ReviewCard(productRating: productRating);
                    }),
          );
  }
}
