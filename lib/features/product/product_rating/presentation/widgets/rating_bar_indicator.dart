import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/manager/rating_bar.dart';

class ProductRatingBarIndicator extends StatelessWidget {
  const ProductRatingBarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.find<RatingBarController>();
    return RatingBar.builder(
      itemCount: 5,
      glow: false,
      minRating: 0.5,
      maxRating: 5.0,
      allowHalfRating: true,
      itemSize: 60.sp,
      unratedColor: neutral50,
      itemBuilder: (BuildContext context, index) {
        return const Icon(
          Icons.star_rounded,
          color: secondary500,
        );
      },
      onRatingUpdate: (double value) {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          value = 0;
          return;
        }
        ratingController.changeRatingNumber(value);
      },
    );
  }
}
