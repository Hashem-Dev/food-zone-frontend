import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';

class IncreaseItemCountButton extends StatelessWidget {
  const IncreaseItemCountButton({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    final isDark = context.brightness == Brightness.dark;
    final ItemCardLogic itemCardController = Get.find();
    return GestureDetector(
      onTap: () {
        itemCardController.increaseMealCount(mealId);
        itemCardController.getTotalPrice();
      },
      child: Container(
        width: context.heightByValue(26),
        height: context.heightByValue(26),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: neutral50),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.add,
          size: 18.sp,
          color: isDark ? neutral100 : neutral900,
        ),
      ),
    );
  }
}
