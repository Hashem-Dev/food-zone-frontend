import 'package:cloudinary_flutter/cloudinary_object.dart';
import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery.dart';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/main/user/liked/data/models/favorite_product.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/blur_background.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/favorite_title.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/meal/meal_covers.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/meal/meal_price.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/meal/meal_restaurant_title.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';

class FavoriteMealCard extends StatelessWidget {
  const FavoriteMealCard({super.key, required this.meal});

  final FavoriteMealMeals meal;

  @override
  Widget build(BuildContext context) {
    final String restaurantTitle =
        context.isEn ? meal.restaurant.title.en : meal.restaurant.title.ar;
    final String mealTitle = context.isEn ? meal.title.en : meal.title.ar;

    return GestureDetector(
      onTap: () => Get.to(() => MealDetails(mealId: meal.id)),
      child: Container(
        margin: EdgeInsets.only(bottom: context.heightByValue(12)),
        width: context.width,
        height: context.heightByValue(140),
        child: ContainerWithShadow(
          radius: 12,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.horizontalPadding(8),
              vertical: context.verticalPadding(8),
            ),
            child: Stack(
              children: <Widget>[
                MealCovers(images: meal.images),
                const BlurBackground(),
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 8.h,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FavoriteTitle(title: mealTitle),
                            FavoriteMealPrice(price: meal.price)
                          ],
                        ),
                        addVerticalSpace(context.heightByValue(8)),
                        Row(
                          children: [
                            SizedBox(
                              width: context.widthByValue(20),
                              height: context.widthByValue(20),
                              child: CldImageWidget(
                                fit: BoxFit.cover,
                                publicId: meal.restaurant.logo,
                                memCacheWidth: context.widthByValue(20).round(),
                                memCacheHeight:
                                    context.widthByValue(20).round(),
                                filterQuality: FilterQuality.high,
                                placeholder: (context, string) => const Center(
                                  child: LoadingIndicator(),
                                ),
                                errorBuilder: (context, string, ob) {
                                  return const Center(
                                    child: Icon(SolarIconsOutline.infoCircle),
                                  );
                                },
                                cloudinary: CloudinaryObject.fromCloudName(
                                  cloudName: cloudinaryName,
                                ),
                                transformation: Transformation()
                                  ..delivery(Delivery.format(Format.auto))
                                  ..delivery(
                                      Delivery.quality(Quality.autoGood()))
                                  ..resize(
                                    Resize.fill()
                                      ..width(context.width.round())
                                      ..height(
                                          context.heightByValue(300).round()),
                                  ),
                              ),
                            ),
                            addHorizontalSpace(
                              context.widthByValue(10),
                            ),
                            MealRestaurantTitle(title: restaurantTitle),
                            const Spacer(),
                            ProductRating(
                              rate: meal.rating,
                              fontSize: 14,
                              iconSize: 16,
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
                  child: MealLikeButton(
                    id: meal.id,
                    width: 30,
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
