import 'package:food_zone/core/global_widgets/text_line_through.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

import '../manager/meal_count.dart';

class MealPriceText extends StatelessWidget {
  const MealPriceText({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController = Get.find();
    final MealCountController mealCountController = Get.find();
    final price = mealController.mealDetails?.price;
    final priceWithoutDiscount =
        mealController.mealDetails?.priceWithoutDiscount;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (priceWithoutDiscount != 0)
          TextLineThrough(text: '\$ $priceWithoutDiscount'),
        if (priceWithoutDiscount != 0) addHorizontalSpace(12),
        Obx(() {
          final count = mealCountController.mealCount;
          final finalPrice =
              (price ?? 0 + mealController.additivePrice) * count;
          return Text(
            '\$ ${finalPrice.toStringAsFixed(2)}',
            style: TextStyle(
              color: primary500,
              fontWeight: FontWeight.w800,
              fontSize: 22.sp,
            ),
          );
        }),
      ],
    );
  }
}
