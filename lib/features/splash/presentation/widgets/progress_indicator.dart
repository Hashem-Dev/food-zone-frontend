import 'package:food_zone/exports.dart';

class SplashProgressIndicator extends StatelessWidget {
  const SplashProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        curve: Curves.linearToEaseOut,
        duration: const Duration(seconds: 4),
        builder: (context, double value, child) {
          return LinearProgressIndicator(
            borderRadius: BorderRadius.circular(12.r),
            value: value,
            minHeight: 6.h,
            color: primaryWhite,
            backgroundColor: primary600,
          );
        },
      ),
    );
  }
}
