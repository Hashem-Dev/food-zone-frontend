import 'package:food_zone/exports.dart';

class UserReviewText extends StatelessWidget {
  const UserReviewText({super.key, this.text = 'Review Text'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: context.textStyle.displaySmall!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
