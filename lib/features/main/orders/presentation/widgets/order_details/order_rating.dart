import 'package:food_zone/exports.dart';

class OrderRating extends StatelessWidget {
  const OrderRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        itemCount: 5,
        itemSize: 60.sp,
        maxRating: 5,
        minRating: 1,
        allowHalfRating: true,
        unratedColor: neutral50,
        itemBuilder: (context, index) {
          return const Icon(
            Icons.star_rounded,
            color: secondary500,
          );
        },
        onRatingUpdate: (value) {},
      ),
    );
  }
}
