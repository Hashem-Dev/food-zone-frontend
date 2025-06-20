import 'package:food_zone/exports.dart';

class RestaurantTime extends StatelessWidget {
  const RestaurantTime({super.key, required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(width: 1, color: primary500),
      ),
      child: Text(
        time,
        overflow: TextOverflow.ellipsis,
        style: context.textStyle.displaySmall!.copyWith(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
