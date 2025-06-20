import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/user_avatar.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/user_name.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/user_rating_date.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/user_rating_stars.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/widgets/review_details_card/user_review_text.dart';
import 'package:food_zone/features/product/product_rating/data/models/product_ratings.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.productRating});

  final ProductRating productRating;

  @override
  Widget build(BuildContext context) {
    final day = productRating.createdAt.day;
    final month = productRating.createdAt.month;
    final year = productRating.createdAt.year;
    return Container(
      margin: EdgeInsets.only(bottom: context.h * 0.02817),
      width: context.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              UserAvatar(userAvatar: productRating.user.avatar.url),
              addHorizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        UserName(username: productRating.user.name.en),
                        UserRatingStars(rating: productRating.rating),
                      ],
                    ),
                    UserRatingDate(ratingDate: '$day/$month/$year')
                  ],
                ),
              ),
            ],
          ),
          addVerticalSpace(context.heightByValue(12)),
          UserReviewText(text: productRating.review)
        ],
      ),
    );
  }
}
