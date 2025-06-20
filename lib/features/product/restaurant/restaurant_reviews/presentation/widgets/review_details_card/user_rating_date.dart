import 'package:food_zone/exports.dart';

class UserRatingDate extends StatelessWidget {
  const UserRatingDate({super.key, required this.ratingDate});

  final String ratingDate;

  @override
  Widget build(BuildContext context) {
    return Text(
      ratingDate,
      style: TextStyle(
        color: neutral200,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
