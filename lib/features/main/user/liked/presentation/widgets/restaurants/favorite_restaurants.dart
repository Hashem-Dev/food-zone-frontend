import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_logo.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_restaurants.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/blur_background.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/favorite_title.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/restaurants/restaurant_address_title.dart';
import 'package:food_zone/features/product/restaurant/presentation/pages/restaurant_details.dart';

class FavoriteRestaurantCards extends StatelessWidget {
  const FavoriteRestaurantCards({super.key, required this.restaurants});

  final List<FavoriteRestaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = restaurants[index].restaurant;
          final restaurantTitle =
              context.isEn ? restaurant.title.en : restaurant.title.ar;

          return GestureDetector(
            onTap: () => Get.to(
              () => RestaurantDetails(restaurantId: restaurant.restaurantId),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              width: context.width,
              height: context.heightByValue(140),
              margin: EdgeInsets.only(bottom: context.heightByValue(12)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ContainerWithShadow(
                radius: 12,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0.w,
                    vertical: 8.h,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: context.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r)),
                        child: OptimizedImageLoader(
                          imageUrl: restaurant.cover,
                          height: 250,
                          width: 500,
                        ),
                      ),
                      const BlurBackground(),
                      Positioned.fill(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FavoriteTitle(title: restaurantTitle),
                              addVerticalSpace(context.heightByValue(8)),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    SolarIconsOutline.mapPoint,
                                    color: primary500,
                                    size: 18.w,
                                  ),
                                  addHorizontalSpace(context.widthByValue(5)),
                                  Expanded(
                                    child: RestaurantAddressTitle(
                                      title: restaurant.coords.address,
                                    ),
                                  ),
                                  ProductRating(
                                    rate: restaurant.rating,
                                    iconSize: 20,
                                    fontSize: 15,
                                    textColor: neutral50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w,
                            vertical: 6.h,
                          ),
                          child: RestaurantLikeButton(
                            restaurantId: restaurant.id,
                            width: 30,
                            iconSize: 20,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0.w,
                            vertical: 6.h,
                          ),
                          child: RestaurantLogo(
                            logo: restaurant.logo,
                            width: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
