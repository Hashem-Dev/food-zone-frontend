import 'package:food_zone/exports.dart';

class FavoriteTitle extends StatelessWidget {
  const FavoriteTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: primaryWhite,
      ),
    );
  }
}
