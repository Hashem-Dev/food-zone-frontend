import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_address.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_cover.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_logo.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_time.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_title.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/product/restaurant/presentation/pages/restaurant_details.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    super.key,
    required this.restaurant,
    this.openedWidget = false,
  });

  final Restaurant restaurant;
  final bool openedWidget;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => RestaurantDetails(restaurantId: restaurant.id),
        preventDuplicates: true,
      ),
      child: SizedBox(
        width: context.widthByValue(265),
        height: context.heightByValue(192),
        child: ContainerWithShadow(
          radius: 12,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 4.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Stack(
                  children: [
                    RestaurantCover(image: restaurant.cover, width: 400),
                    Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 5.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Align(
                              alignment: Alignment.topRight,
                              child: RestaurantLikeButton(
                                restaurantId: restaurant.id,
                              ),
                            ),
                            RestaurantLogo(logo: restaurant.logo)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                RestaurantTitle(
                  title: context.language == 'en'
                      ? restaurant.title.en
                      : restaurant.title.ar,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ProductRating(rate: restaurant.rating),
                    RestaurantTime(time: restaurant.time),
                  ],
                ),
                RestaurantAddress(address: restaurant.coords.address)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
