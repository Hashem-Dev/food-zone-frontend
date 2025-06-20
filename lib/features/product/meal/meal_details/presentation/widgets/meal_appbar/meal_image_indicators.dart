import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealImageIndicators extends StatelessWidget {
  const MealImageIndicators({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final imageNumber = mealController.mealDetails?.images.length;
    return SizedBox(
      width: 60.w,
      height: 20.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          imageNumber ?? 0,
          (index) {
            return Obx(() {
              final sameIndex = mealController.page == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: sameIndex ? 23.w : 6.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: sameIndex ? primary500 : neutral200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
