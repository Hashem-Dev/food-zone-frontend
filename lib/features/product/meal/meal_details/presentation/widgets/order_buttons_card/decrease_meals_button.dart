import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

import '../../manager/meal_count.dart';

class DecreaseMealsButton extends StatelessWidget {
  const DecreaseMealsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();
    final mealId = mealDetailsController.mealDetails?.id;
    final MealCountController mealCountController = Get.find();
    final BasketItemsController basketItemsController = Get.find();

    return GestureDetector(
      onTap: () {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          return;
        }
        final meal = basketItemsController.basketMeal;
        final isAddedToBasket = basketItemsController.addedToBasket(mealId!);
        mealCountController.decrementMealCount();
        if (meal != null && isAddedToBasket) {
          basketItemsController.addToBasket(meal);
        }
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: neutral50),
          shape: BoxShape.circle,
        ),
        child: SizedBox(
          width: 12.w,
          height: 12.w,
          child: Icon(
            Icons.remove,
            color: context.isDarkMode ? neutral100 : neutral900,
          ),
        ),
      ),
    );
  }
}
