import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class ConfirmDeleteMealDialog extends StatelessWidget {
  const ConfirmDeleteMealDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealDetailsController = Get.find();

    final mealId = mealDetailsController.mealDetails?.id;

    final BasketItemsController basketItemsController = Get.find();
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CupertinoActionSheet(
          title: Text(
            'Confirm Delete',
            style: TextStyle(fontSize: 14.sp),
          ),
          message: SizedBox(
            width: context.w,
            child: Column(
              children: [
                Text(
                  'Are you sure to remove this meal form your basket?',
                  style: TextStyle(fontSize: 16.sp),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CupertinoActionSheetAction(
                      onPressed: () {
                        final isDeleted =
                            basketItemsController.removeFromBasket(mealId!);

                        if (isDeleted) {
                          Navigator.of(context).pop();
                          showSuccessSnackBar('Meal deleted successfully');
                        } else {
                          showErrorSnackBar('Delete meal failed.');
                        }
                      },
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: primary500),
                      ),
                    ),
                    CupertinoActionSheetAction(
                      isDefaultAction: true,
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: primary500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
