import 'package:food_zone/exports.dart';

class UserRatingStars extends StatelessWidget {
  const UserRatingStars({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.w * 0.23918,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) => Icon(
            Icons.star_rounded,
            size: 14.sp,
            color: secondary500,
          ),
        ),
      ),
    );
  }
}
