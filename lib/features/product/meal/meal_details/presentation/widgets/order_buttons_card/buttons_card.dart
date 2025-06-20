import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/order_buttons_card/decrease_meals_button.dart';

import 'add_to_basket_button.dart';
import 'increase_meals_button.dart';

class ButtonsCard extends StatelessWidget {
  const ButtonsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final mealCountController = Get.find<MealCountController>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 10.w,
        ),
        height: context.heightByValue(77),
        width: context.w,
        child: ContainerWithShadow(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const DecreaseMealsButton(),
              Obx(() {
                final count = mealCountController.mealCount;
                return Text(
                  '$count',
                  style: context.textStyle.displaySmall!.copyWith(
                    fontSize: 22.sp,
                  ),
                );
              }),
              const IncreaseMealsButton(),
              AddToBasketButton()
            ],
          ),
        ),
      ),
    );
  }
}
