import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_description.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/description_text.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/nutritional_meal_info.dart';

class MealDescription extends StatelessWidget {
  const MealDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController = Get.find();
    final MealDescriptionController descController = Get.find();
    final description = mealController.descriptionForLanguage();
    final mealInfo = mealController.mealDetails?.nutritionalInfo;

    return Obx(() => GestureDetector(
          onTap: () => descController.changeCollapseState(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: descController.isCollapsed ? 2 : 5,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                    color: neutral300,
                  ),
                ),
                if (!descController.isCollapsed)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(10),
                      const MealDescriptionText(
                        text: 'Nutritional Information',
                      ),
                      addVerticalSpace(10),
                      NutritionalMealInformation(
                        calories: mealInfo?.calories,
                        protein: mealInfo?.protein,
                        carbs: mealInfo?.carbs,
                        fat: mealInfo?.fat,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
