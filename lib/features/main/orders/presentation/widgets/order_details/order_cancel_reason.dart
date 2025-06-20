import 'package:food_zone/exports.dart';

class OrderCancellationReason extends StatelessWidget {
  const OrderCancellationReason({super.key, required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightByValue(54),
      width: context.widthByValue(345),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Reason for Cancellation',
                    style: context.textStyle.displaySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    reason,
                    softWrap: false,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.displaySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: GestureDetector(
              child: SizedBox(
                width: context.widthByValue(42),
                height: context.heightByValue(42),
                child: CircleAvatar(
                  backgroundColor: primary500,
                  child: Icon(SolarIconsBold.pen, size: 26.sp),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
