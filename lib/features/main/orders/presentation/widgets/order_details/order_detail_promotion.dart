import 'package:food_zone/exports.dart';

class OrderDetailPromotion extends StatelessWidget {
  const OrderDetailPromotion({
    super.key,
    required this.name,
    required this.value,
    required this.discountType,
  });

  final String name;
  final String value;
  final String discountType;

  @override
  Widget build(BuildContext context) {
    final symbol = discountType == 'fixed' ? r'$' : '%';
    return Container(
      height: context.heightByValue(80),
      width: context.width,
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
              child: Column(
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
              Row(
                children: [
                  _buildPromotionData(name),
                  _buildPromotionData(value + symbol),
                ],
              )
            ],
          )),
        ],
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
