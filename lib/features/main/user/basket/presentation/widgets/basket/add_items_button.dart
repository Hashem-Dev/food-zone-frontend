import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/closer_meals/presentation/pages/closer_meals.dart';

class AddItemsButton extends StatelessWidget {
  const AddItemsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const AllPopularMeals()),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(width: 2, color: primary500),
        ),
        child: Text(
          'Add Items',
          style: TextStyle(
            fontSize: 12.sp,
            color: primary500,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
