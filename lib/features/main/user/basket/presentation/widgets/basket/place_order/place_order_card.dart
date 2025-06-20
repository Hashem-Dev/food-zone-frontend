import 'package:flutter/cupertino.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/place_order/order_total_price.dart';
import 'package:food_zone/features/main/user/profile_editing/presentation/widgets/discard_button.dart';

class PlaceOrderCard extends StatelessWidget {
  const PlaceOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardController = Get.find();

    return Container(
      height: context.heightByValue(77),
      margin: EdgeInsets.symmetric(vertical: context.verticalPadding(15)),
      width: context.width,
      child: ContainerWithShadow(
        radius: 12,
        darkColor: neutral400,
        child: Row(
          children: <Widget>[
            const Expanded(child: OrderTotalPrice()),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalPadding(8),
                ),
                child: FButton(
                  title: 'Place Order',
                  onPressed: () async {
                    await itemCardController.addNewOrder(() =>
                        showSuccessOrderSheet(
                            context, itemCardController.checkout));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future showSuccessOrderSheet(BuildContext context, Function checkout) async {
    return showCupertinoModalPopup(
      barrierDismissible: false,
      barrierColor: context.isDarkMode ? neutral900 : neutral50,
      context: context,
      builder: (context) => Center(
        child: Material(
          borderRadius: BorderRadius.circular(12.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
            constraints: BoxConstraints(
              maxWidth: context.widthByValue(345),
              minWidth: context.widthByValue(345),
              minHeight: context.heightByValue(414),
              maxHeight: context.heightByValue(414),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: primaryWhite,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Order Successful',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: neutral900,
                  ),
                ),
                Image.asset('assets/icons/confetti.jpg'),
                Text(
                  'Thank you for your order!',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: neutral900,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Your order has been successfully processed.',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: neutral400,
                  ),
                ),
                SizedBox(
                  width: context.width,
                  child: FButton(
                    title: 'Pay',
                    onPressed: () => checkout(),
                  ),
                ),
                SizedBox(
                  width: context.width,
                  child: DiscardButton(
                      background: primaryWhite,
                      onPressed: () => Navigator.of(context).pop()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
