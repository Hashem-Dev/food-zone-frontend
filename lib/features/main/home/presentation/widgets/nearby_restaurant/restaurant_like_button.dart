import 'package:food_zone/core/controllers/add_to_favorite.dart';
import 'package:food_zone/exports.dart';

class RestaurantLikeButton extends StatelessWidget {
  const RestaurantLikeButton({
    super.key,
    this.width = 26,
    this.iconSize = 16,
    required this.restaurantId,
  });

  final double width;
  final double iconSize;
  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(AddProductToFavoriteController());

    return GestureDetector(
      onTap: () async {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          return;
        }
        await favoriteController.addRestaurantToFavorite(restaurantId);
      },
      child: Obx(() {
        final isFavorite =
            favoriteController.restaurantIds.contains(restaurantId);

        return SizedBox(
          width: context.widthByValue(width),
          height: context.widthByValue(width),
          child: ContainerWithShadow(
            radius: 50,
            child: CircleAvatar(
              backgroundColor: context.isDarkMode ? neutral500 : primaryWhite,
              child: Icon(
                isFavorite ? SolarIconsBold.heart : SolarIconsOutline.heart,
                color: primary500,
                size: iconSize.sp,
              ),
            ),
          ),
        );
      }),
    );
  }
}
