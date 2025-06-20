import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealTitle extends StatelessWidget {
  const MealTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController = Get.find();

    return Text(
      mealController.getMealTitleForLanguage() ?? '',
      style: context.textStyle.headlineSmall!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 22.sp,
      ),
    );
  }
}
