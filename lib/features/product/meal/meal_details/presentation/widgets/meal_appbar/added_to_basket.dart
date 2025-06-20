import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/basket_items.dart';

class AddedToBasket extends StatelessWidget {
  const AddedToBasket({super.key});

  @override
  Widget build(BuildContext context) {
    final BasketItemsController basketItemsController = Get.find();
    final int basketItemCount = basketItemsController.basketItemCount;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        0,
        0,
        context.heightByValue(10),
        0,
      ),
      child: Container(
        height: context.heightByValue(42),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: primary500,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              SolarIconsBold.bag5,
              size: 21.sp,
              color: primaryWhite,
            ),
            addHorizontalSpace(8),
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: primaryWhite, width: 1.w),
              ),
              height: context.heightByValue(26),
              width: context.heightByValue(26),
              child: Text(
                '$basketItemCount',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: primaryWhite,
                ),
              ),
            )
          ],
        ),
      ).animate().fadeIn(),
    );
  }
}
