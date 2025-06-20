import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_like_button.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/back_button.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/is_restaurant_opened.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_cover.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_logo.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_time.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_title.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/share_button.dart';

PreferredSize restaurantDetailsAppbar(BuildContext context) {
  final RestaurantDataController restaurantController = Get.find();

  return PreferredSize(
    preferredSize: Size(context.w, context.heightByValue(280)),
    child: Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      height: context.heightByValue(280),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const RestaurantDetailsCover(),
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.4),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.w * 0.02036,
                vertical: context.h * 0.00939,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const RestaurantDetailsLogo(),
                  addHorizontalSpace(16),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RestaurantDetailsTitle(),
                      const RestaurantDetailsTime(),
                      addVerticalSpace(5),
                      const IsRestaurantOpened()
                    ],
                  ),
                  const Spacer(),
                  RestaurantLikeButton(
                    width: 42,
                    iconSize: 24,
                    restaurantId: restaurantController.restaurant!.id,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SafeArea(
              child: SizedBox(
                height: context.heightByValue(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const AppBackButton(horizontal: 8),
                    GradientAppbarTitle(
                      title:
                          restaurantController.getRestaurantTitleForLanguage(),
                    ),
                    const AppShareButton(horizontal: 8, vertical: 0)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
