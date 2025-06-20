import 'package:food_zone/exports.dart';

import 'review_rating.dart';
import 'review_rating_bar.dart';

class MealRating extends StatelessWidget {
  const MealRating({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.877863,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[ReviewRating(), ReviewRatingBar()],
      ),
    );
  }
}
