import 'package:food_zone/exports.dart';

class UserRatingStars extends StatelessWidget {
  const UserRatingStars({super.key, this.rating = 2.3});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.23918,
      child: RatingBarIndicator(
        unratedColor: neutral50,
        itemCount: 5,
        rating: rating,
        itemSize: 15.sp,
        itemBuilder: (BuildContext context, int index) {
          return const Icon(Icons.star_rounded, color: secondary500);
        },
      ),
    );
  }
}
