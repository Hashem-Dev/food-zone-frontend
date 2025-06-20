import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealTitle extends StatelessWidget {
  const MealTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final title = mealController.getMealTitleForLanguage();
    return Text(
      title ?? '',
      style: context.textStyle.displaySmall!.copyWith(fontSize: 22.sp),
    );
  }
}
