import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_description.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final descriptionController = Get.find<MealDescriptionController>();

    return Obx(
      () => GestureDetector(
        onTap: () {
          descriptionController.changeCollapseState();
        },
        child: SizedBox(
          width: context.w,
          child: Text(
            textAlign: TextAlign.end,
            descriptionController.isCollapsed ? 'See more' : '',
            style: TextStyle(
              color: neutral300,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              decorationStyle: TextDecorationStyle.wavy,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
