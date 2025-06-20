import 'package:food_zone/exports.dart';

class AppShareButton extends StatelessWidget {
  const AppShareButton({
    super.key,
    this.vertical = 40,
    this.horizontal = 10,
  });

  final double vertical;
  final double horizontal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal.w,
        vertical: vertical.h,
      ),
      child: GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          width: 42.h,
          height: 42.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryWhite.withValues(alpha: .5),
          ),
          child: Icon(
            SolarIconsBold.forward,
            size: 19.sp,
            color: context.isDarkMode ? neutral900 : primaryWhite,
          ),
        ),
      ),
    );
  }
}
