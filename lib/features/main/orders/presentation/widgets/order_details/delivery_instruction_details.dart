import 'package:food_zone/exports.dart';

class OrderDeliveryInstruction extends StatelessWidget {
  const OrderDeliveryInstruction({super.key, required this.instruction});

  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.heightByValue(80),
      width: context.widthByValue(345),
      decoration: BoxDecoration(
        color: context.isDarkMode ? neutral500 : primaryWhite,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          width: 1,
          color: context.isDarkMode ? neutral300 : neutral50,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: Column(
        spacing: context.heightByValue(8),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              spacing: context.widthByValue(8),
              children: <Widget>[
                Icon(SolarIconsBold.notes, color: primary500, size: 20.sp),
                Text(
                  'Delivery Instruction',
                  style: context.textStyle.displaySmall!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              instruction,
              maxLines: 1,
              softWrap: false,
              overflow: TextOverflow.ellipsis,
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
