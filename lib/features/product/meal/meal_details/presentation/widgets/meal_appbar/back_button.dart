import 'package:food_zone/exports.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.horizontal = 10});

  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal.w),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: 42.h,
          height: 42.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryWhite.withValues(alpha: .4),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 19.sp,
            color: context.isDarkMode ? neutral900 : primaryWhite,
          ),
        ),
      ),
    );
  }
}
