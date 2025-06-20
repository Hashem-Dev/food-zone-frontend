import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_like_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/added_to_basket.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/back_button.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/delete_meal_basket_button.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/meal_image_indicators.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/meal_images.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/open_restaurant_button.dart';

PreferredSize mealDetailsAppBar(BuildContext context) {
  final MealDetailsController mealController = Get.find();
  final String? mealId = mealController.mealDetails?.id;
  final BasketItemsController basketItemsController =
      Get.put(BasketItemsController());

  return PreferredSize(
    preferredSize: Size(context.w, context.heightByValue(300)),
    child: mealId == null
        ? ShimmerContainer(width: context.w, height: context.heightByValue(300))
        : Obx(() {
            final bool isSelected = basketItemsController.addedToBasket(mealId);
            return Stack(
              fit: StackFit.loose,
              children: <Widget>[
                const MealImages(),
                const SafeArea(child: AppBackButton()),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0.w,
                      vertical: 5.h,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const MealImageIndicators(),
                        Row(
                          children: [
                            MealLikeButton(id: mealId, width: 42, iconSize: 30),
                            addHorizontalSpace(10),
                            const OpenRestaurantButton(),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                if (isSelected)
                  SafeArea(
                    child: Row(
                      spacing: context.widthByValue(10),
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const DeleteMealBasketButton(),
                        const AddedToBasket(),
                      ],
                    ),
                  ),
              ],
            );
          }),
  );
}
