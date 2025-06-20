import 'package:food_zone/exports.dart';

class LogoAndTitleRestaurant extends StatelessWidget {
  const LogoAndTitleRestaurant({
    super.key,
    required this.logo,
    required this.restaurantTitle,
  });

  final String logo;
  final String restaurantTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 18.h,
          height: 18.h,
          decoration: BoxDecoration(
            border: Border.all(width: .5, color: primaryWhite),
            shape: BoxShape.circle,
          ),
          child: ImageLoader(imageUrl: logo),
        ),
        addHorizontalSpace(5),
        Text(
          restaurantTitle,
          style: TextStyle(
            color: neutral100,
            fontSize: 12.sp,
          ),
        )
      ],
    );
  }
}
