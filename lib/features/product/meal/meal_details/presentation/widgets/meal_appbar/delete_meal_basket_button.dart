import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/confirm_delete_dialog.dart';

class DeleteMealBasketButton extends StatelessWidget {
  const DeleteMealBasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return const ConfirmDeleteMealDialog();
            });
      },
      child: SizedBox(
        width: 42.w,
        height: 42.w,
        child: const ContainerWithShadow(
          radius: 22,
          child: Icon(
            SolarIconsOutline.trashBin2,
            color: primary500,
          ),
        ),
      ),
    );
  }
}
