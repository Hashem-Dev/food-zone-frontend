import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/decrease_item_count_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/delete_item_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/edit_item_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/increase_item_count_button.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_additives.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_image.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_meal_count.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_price.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_title.dart';

class BasketItemCard extends StatelessWidget {
  const BasketItemCard({super.key, required this.meal});

  final BasketMeal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(vertical: context.verticalMargin(5)),
      child: ContainerWithShadow(
        radius: 12,
        darkColor: neutral600,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.verticalPadding(8),
            horizontal: context.horizontalPadding(8),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ItemImage(meal.coverUrl),
                  addHorizontalSpace(context.widthByValue(12)),
                  SizedBox(
                    height: context.heightByValue(77),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ItemTitle(title: meal.mealTitle),
                        const Spacer(),
                        ItemPrice(
                          price: meal.price,
                          priceBeforeDiscount: meal.priceBeforeDiscount,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: context.widthByValue(87),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DecreaseItemCountButton(mealId: meal.mealId),
                              ItemMealCount(count: meal.mealCount),
                              IncreaseItemCountButton(mealId: meal.mealId),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        EditItemButton(mealId: meal.mealId),
                        addHorizontalSpace(8),
                        DeleteItemButton(mealId: meal.mealId)
                      ],
                    ),
                  ),
                ],
              ),
              if (meal.selectedAdditives.isNotEmpty)
                ItemAdditives(additives: meal.selectedAdditives)
            ],
          ),
        ),
      ),
    );
  }
}
