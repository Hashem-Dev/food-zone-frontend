import 'package:food_zone/exports.dart';

class UserReviewText extends StatelessWidget {
  const UserReviewText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.start,
        style: context.textStyle.displaySmall!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 16.sp,
        ),
        'One of the best chicken burgers I\'ve ever had! The chicken was tender and the bun was soft. Loved every bite!');
  }
}
