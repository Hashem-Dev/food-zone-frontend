import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';

class DeleteItemButton extends StatelessWidget {
  const DeleteItemButton({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardController = Get.find();
    return GestureDetector(
      onTap: () {
        itemCardController.deleteMealFromBasket(mealId);
        itemCardController.getTotalPrice();
      },
      child: const Icon(Icons.close_rounded, color: neutral100),
    );
  }
}
