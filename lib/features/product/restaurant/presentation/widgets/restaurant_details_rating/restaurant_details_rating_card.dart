import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_rating/restaurant_details_rating_count.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_rating/restaurant_details_rating_stars.dart';

class RestaurantDetailsRatingCard extends StatelessWidget {
  const RestaurantDetailsRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      height: 50.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.appTheme.inputDecorationTheme.fillColor,
        border: Border.all(
          color: context.appTheme.inputDecorationTheme.border!.borderSide.color,
        ),
      ),
      child: ContainerWithShadow(
        radius: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const RestaurantDetailsRatingStars(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 3.h),
              width: 1.w,
              decoration: BoxDecoration(
                color: neutral200,
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            const RestaurantDetailsRatingCount(),
          ],
        ),
      ),
    );
  }
}
