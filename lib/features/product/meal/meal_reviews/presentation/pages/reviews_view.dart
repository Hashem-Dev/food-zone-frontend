import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/meal_title.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_rating/meal_rating.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_tab_bar/reviews_tab_bar.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/reviews_tabs/all_reviews.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        appBar: AppBar(title: const GradientAppbarTitle(title: 'Reviews')),
        body: ResponsiveLayout(
          portrait: SizedBox(
            height: context.h,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MealTitle(),
                Spacer(flex: 1),
                MealRating(),
                Spacer(flex: 1),
                ReviewsTabBar(),
                Spacer(flex: 1),
                Expanded(
                  flex: 16,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /* All reviews for meal */
                      AllReviews(),

                      /* All positive reviews for meal */
                      AllReviews(isPositive: true),

                      /* All negative reviews for meal */
                      AllReviews(isPositive: false),

                      /* All 5 STARS reviews for meal */
                      AllReviews(isPositive: true, rating: 5),

                      /* All 4 STARS reviews for meal */
                      AllReviews(isPositive: true, rating: 4),

                      /* All 3 STARS reviews for meal */
                      AllReviews(isPositive: false, rating: 3),

                      /* All 2 STARS reviews for meal */
                      AllReviews(isPositive: false, rating: 2),

                      /* All 1 STARS reviews for meal */
                      AllReviews(isPositive: false, rating: 1),
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
