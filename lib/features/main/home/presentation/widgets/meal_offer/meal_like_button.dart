import 'package:food_zone/core/controllers/add_to_favorite.dart';
import 'package:food_zone/exports.dart';

class MealLikeButton extends StatelessWidget {
  const MealLikeButton({
    super.key,
    required this.id,
    this.width = 26,
    this.height = 26,
    this.iconSize = 18,
  });

  final String id;
  final double width;
  final double height;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final favoriteController = Get.put(AddProductToFavoriteController());
    return GestureDetector(
      onTap: () {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          return;
        }
        favoriteController.addMealToFavorite(id);
      },
      child: Container(
        margin: EdgeInsets.only(top: 5.h, right: 5.w),
        child: Obx(() {
          final isFavorite = favoriteController.mealIds.contains(id);
          return SizedBox(
            width: context.widthByValue(width),
            height: context.widthByValue(width),
            child: CircleAvatar(
              backgroundColor: context.isDarkMode ? neutral500 : primaryWhite,
              child: Icon(
                isFavorite ? SolarIconsBold.heart : SolarIconsOutline.heart,
                color: primary500,
                size: iconSize.w,
              ),
            ),
          );
        }),
      ),
    );
  }
}
