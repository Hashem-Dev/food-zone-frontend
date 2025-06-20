import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/basket_item_card.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardController = Get.find();

    return Obx(() {
      final List<BasketMeal> basketItems = itemCardController.cartItems;
      return AnimatedList(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          key: itemCardController.animatedListKey,
          initialItemCount: itemCardController.cartItems.length,
          itemBuilder: (context, index, animation) {
            final BasketMeal meal = basketItems[index];
            return BasketItemCard(meal: meal);
          });
    });
  }
}
