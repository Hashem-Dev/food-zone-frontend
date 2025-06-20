import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class AddToBasketButton extends StatelessWidget {
  AddToBasketButton({super.key});

  final BasketItemsController basketItemsController =
      Get.put(BasketItemsController());

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();

    final mealDetails = mealDetailsController.mealDetails;
    final selectedAdditives = mealDetailsController.selectedAdditives;

    return mealDetails == null
        ? const Text('data')
        : Obx(() {
            final mealId = mealDetails.id;
            final price = mealDetails.price;
            final isAddedToBasket = basketItemsController.addedToBasket(mealId);
            basketItemsController.setBasketMeal(mealId: mealId);
            return ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(primary500),
                foregroundColor: WidgetStatePropertyAll(primaryWhite),
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
              ),
              onPressed: () {
                if (prefs.refreshToken.isEmpty) {
                  redirectDialog(context);
                  return;
                }
                final BasketMeal meal = BasketMeal(
                  mealId: mealId,
                  mealTitle: mealDetails.title,
                  coverUrl: mealDetails.images.first.url,
                  selectedAdditives: selectedAdditives,
                  priceBeforeDiscount: mealDetails.priceWithoutDiscount,
                  price: price,
                );

                basketItemsController.addToBasket(meal);
                basketItemsController.setBasketMeal(meal: meal);
              },
              child: SizedBox(
                width: context.widthByValue(190),
                height: context.heightByValue(53),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      isAddedToBasket
                          ? SolarIconsBold.checkCircle
                          : SolarIconsBold.bag5,
                      size: 24.sp,
                      color: primaryWhite,
                    ),
                    addHorizontalSpace(5),
                    Text(
                      isAddedToBasket ? 'Added to Basket' : 'Add to Basket',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
  }
}
