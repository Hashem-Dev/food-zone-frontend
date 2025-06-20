import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

import 'additive_checkbox.dart';

class MealAdditives extends StatelessWidget {
  const MealAdditives({super.key, required this.additive});

  final List<Additive> additive;

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController = Get.find();
    final BasketItemsController itemsController = Get.find();
    final additives = mealController.mealDetails?.additives;
    final String mealId = mealController.mealDetails?.id ?? '';

    /*
    Get saved meal additives for specific meal that add to the basket.

    // final List<SelectedAdditives> lastAdditives =
    //     prefs.selectedMealAdditives(mealId: mealId);
    //
    //  Get saved meal additives for specific meal that add to the basket.
    // itemsController.setSelectedAdditives(lastAdditives);
       */

    return additives == null
        ? ShimmerContainer(width: context.w, height: 40.h)
        : Column(
            children: List.generate(additives.length, (index) {
              final title = additives[index].title.en;
              final description = additives[index].description.en;
              final price = additives[index].price;
              final id = additives[index].id;

              return Obx(() {
                /* Check if any additive of meal is selected */
                final bool selected =
                    mealController.selectedAdditives.any((additive) {
                  return additive.additiveId == id;
                });

                return SizedBox(
                  width: context.w,
                  child: ListTile(
                    onTap: () {
                      if (prefs.refreshToken.isEmpty) {
                        redirectDialog(context);
                        return;
                      }
                      final SelectedAdditives selectedAdditives =
                          SelectedAdditives(
                        additiveId: id,
                        additives: additives[index],
                      );

                      mealController.selectAdditives(selectedAdditives, price);
                      itemsController.setUpdatedAdditives(
                        mealController.selectedAdditives,
                      );
                      final isAddedToBasket =
                          itemsController.addedToBasket(mealId);

                      if (itemsController.basketMeal != null &&
                          isAddedToBasket) {
                        itemsController
                            .addToBasket(itemsController.basketMeal!);
                      }
                    },
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 0,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '+ \$$price',
                          style: context.textStyle.displaySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        addHorizontalSpace(12),
                        AdditiveCheckbox(isSelected: (selected)),
                      ],
                    ),
                    title: Text(title, style: context.textStyle.displaySmall),
                    subtitle: Text(
                      description,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: neutral200,
                      ),
                    ),
                  ),
                );
              });
            }),
          );
  }
}
