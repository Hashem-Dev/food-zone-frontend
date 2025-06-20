import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/pages/promotions.dart';

class OrderPromotion extends StatelessWidget {
  const OrderPromotion({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic cardLogic = Get.find();
    return GestureDetector(
      onTap: () => Get.to(() => const PromotionsView()),
      child: Container(
        height: context.heightByValue(80),
        width: context.widthByValue(345),
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding(16),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: context.isDarkMode ? neutral400 : neutral50,
            width: 1,
          ),
          color: context.isDarkMode ? neutral600 : primaryWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Obx(() {
                final Map<String, dynamic>? promotion = cardLogic.promotionData;
                return Column(
                  spacing: context.heightByValue(8),
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: context.widthByValue(8),
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          SolarIconsBold.ticketSale,
                          color: primary500,
                          size: 20.sp,
                        ),
                        Text(
                          'Promotions',
                          style: context.textStyle.displaySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    promotion == null
                        ? Text(
                            'Select Your Discounts',
                            style: TextStyle(
                              color: (context.isDarkMode
                                  ? neutral400
                                  : neutral100),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Row(
                            children: [
                              _buildPromotionData(promotion['name']),
                              _buildPromotionData(promotion['discount']),
                            ],
                          )
                  ],
                );
              }),
            ),
            SizedBox(
              height: context.heightByValue(36),
              width: context.widthByValue(36),
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: neutral100,
                size: 30.r,
              ),
            )
          ],
        ),
      ),
    );
  }

  Card _buildPromotionData(String data) {
    return Card(
      color: secondary500,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.0.w,
          vertical: 2.5.h,
        ),
        child: Text(
          data.toUpperCase(),
          style: TextStyle(
            color: primaryWhite,
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
