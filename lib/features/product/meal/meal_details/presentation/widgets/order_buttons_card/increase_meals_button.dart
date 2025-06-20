import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class IncreaseMealsButton extends StatelessWidget {
  const IncreaseMealsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();
    final MealCountController mealCountController = Get.find();
    final BasketItemsController itemsController = Get.find();
    final mealDetails = mealDetailsController.mealDetails;

    return GestureDetector(
      onTap: () {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          return;
        }
        final mealId = mealDetails!.id;
        final isAddedToBasket = itemsController.addedToBasket(mealId);
        final BasketMeal? meal = itemsController.basketMeal;
        mealCountController.incrementMealCount();

        if (meal != null && isAddedToBasket) {
          itemsController.addToBasket(meal);
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
            Icons.add,
            color: context.isDarkMode ? neutral100 : neutral900,
          ),
        ),
      ),
    );
  }
}
