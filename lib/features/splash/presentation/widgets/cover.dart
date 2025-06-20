import 'package:food_zone/exports.dart';

class SplashCover extends StatelessWidget {
  const SplashCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h,
      padding: EdgeInsets.only(right: 200.w),
      child: Lottie.asset(
        repeat: false,
        FAssets.splashLottie,
        fit: BoxFit.cover,
      ),
    );
  }
}
