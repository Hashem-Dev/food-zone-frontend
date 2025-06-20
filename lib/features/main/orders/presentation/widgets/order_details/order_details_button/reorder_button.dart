import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class ReorderAllButton extends StatelessWidget {
  const ReorderAllButton({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic orderLogic = Get.find();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
      child: ElevatedButton(
        onPressed: () async {
          await orderLogic.showReorderConfirmation(
            context,
            () => orderLogic.reorderAllMeal(),
          );
        },
        style: ElevatedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.padded,
          visualDensity: VisualDensity.compact,
          backgroundColor: primary500,
          elevation: .8,
          foregroundColor: primary900,
          shadowColor: primary500,
          disabledBackgroundColor: primary100,
          animationDuration: const Duration(seconds: 5),
        ),
        child: Row(
          spacing: context.widthByValue(15),
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(SolarIconsBold.bag5, color: primaryWhite, size: 20.sp),
            Text(
              'Reorder',
              style: TextStyle(
                color: primaryWhite,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
