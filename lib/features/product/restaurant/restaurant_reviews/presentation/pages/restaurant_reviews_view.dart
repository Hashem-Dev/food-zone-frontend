import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/widgets/restaurant_review_title.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/widgets/review_rating/restaurant_rating.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/widgets/review_tab_bar/reviews_tab_bar.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/widgets/reviews_tabs/all_reviews.dart';

class RestaurantReviewsView extends StatelessWidget {
  const RestaurantReviewsView({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(title: const GradientAppbarTitle(title: 'Reviews')),
        body: ResponsiveLayout(
          portrait: SizedBox(
            height: context.h,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const RestaurantReviewTitle(),
                const Spacer(),
                const RestaurantRating(),
                const Spacer(),
                const RestaurantReviewsTabBar(),
                const Spacer(),
                Expanded(
                  flex: 16,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /* All reviews for meal */
                      RAllReviews(restaurantId),

                      /* All positive reviews for meal */
                      RAllReviews(restaurantId, isPositive: true),

                      /* All negative reviews for meal */
                      RAllReviews(restaurantId, isPositive: false),

                      /* All 5 STARS reviews for meal */
                      RAllReviews(restaurantId, isPositive: true, rating: 5),

                      /* All 4 STARS reviews for meal */
                      RAllReviews(restaurantId, isPositive: true, rating: 4),

                      /* All 3 STARS reviews for meal */
                      RAllReviews(restaurantId, isPositive: false, rating: 3),

                      /* All 2 STARS reviews for meal */
                      RAllReviews(restaurantId, isPositive: false, rating: 2),

                      /* All 1 STARS reviews for meal */
                      RAllReviews(restaurantId, isPositive: false, rating: 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
