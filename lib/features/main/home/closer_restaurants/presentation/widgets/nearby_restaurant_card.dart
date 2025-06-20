import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/manager/restaurant_time_converter.dart';
import 'package:food_zone/features/main/home/closer_restaurants/presentation/widgets/opened_restaurant.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_address.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_cover.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_like_button.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_logo.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_time.dart';
import 'package:food_zone/features/main/home/presentation/widgets/nearby_restaurant/restaurant_title.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/product/restaurant/presentation/pages/restaurant_details.dart';

/// A widget that displays a card for a nearby restaurant.
///
/// This widget shows the restaurant's cover image, logo, title, rating,
/// opening status, time, and address. When tapped, it navigates to the
/// restaurant's details page.
class CloserRestaurantCard extends StatelessWidget {
  /// Creates a [CloserRestaurantCard] widget.
  ///
  /// The [restaurant] parameter must not be null.
  const CloserRestaurantCard({super.key, required this.restaurant});

  /// The restaurant to be displayed in the card.
  final Restaurant restaurant;

  /// Builds the widget tree for the [CloserRestaurantCard].
  ///
  /// This method constructs the UI elements for the restaurant card, including
  /// the cover image, logo, title, rating, opening status, time, and address.
  /// It also handles the tap event to navigate to the restaurant's details page.
  ///
  /// @param context The build context.
  /// @returns A [Widget] representing the restaurant card.
  @override
  Widget build(BuildContext context) {
    bool isOpened = isRestaurantOpened(restaurant.time);

    return GestureDetector(
      onTap: () {
        Get.to(() => RestaurantDetails(restaurantId: restaurant.id));
      },
      child: SizedBox(
        height: context.heightByValue(110),
        width: context.width,
        child: ContainerWithShadow(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: SizedBox(
              width: context.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: context.widthByValue(100),
                    height: context.widthByValue(100),
                    child: RestaurantCover(
                      image: restaurant.cover,
                      height: 300,
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              width: context.widthByValue(20),
                              child: RestaurantLogo(logo: restaurant.logo),
                            ),
                            addHorizontalSpace(5),
                            RestaurantTitle(
                              title: context.language == 'en'
                                  ? restaurant.title.en
                                  : restaurant.title.ar,
                            ),
                            const Spacer(),
                            ProductRating(rate: restaurant.rating),
                            addHorizontalSpace(8),
                            Align(
                              alignment: Alignment.topRight,
                              child: RestaurantLikeButton(
                                restaurantId: restaurant.id,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            OpenedRestaurant(isOpened: isOpened),
                            RestaurantTime(time: restaurant.time),
                          ],
                        ),
                        RestaurantAddress(address: restaurant.coords.address)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
