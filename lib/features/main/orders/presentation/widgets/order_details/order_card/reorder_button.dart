import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class ItemReorderButton extends StatelessWidget {
  const ItemReorderButton({super.key, required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic orderDetailsLogic = Get.find();
    return GestureDetector(
      onTap: () async {
        await orderDetailsLogic.showReorderConfirmation(
          context,
          title: 'Confirm Reorder Item',
          subtitle: 'Are you sure to reorder this item?',
          () => orderDetailsLogic.reorderMeal(item),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: primary500,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          spacing: context.widthByValue(5.6),
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(SolarIconsBold.bag5, color: primaryWhite, size: 14.sp),
            Text(
              'Reorder',
              style: TextStyle(
                color: primaryWhite,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
