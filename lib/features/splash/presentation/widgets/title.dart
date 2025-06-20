import 'package:food_zone/exports.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Food Zone',
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w900,
        fontFamily: 'SFDisplay',
        color: primaryWhite,
      ),
    )
        .animate()
        .fadeIn(
          delay: const Duration(seconds: 5),
          duration: 2000.ms,
          curve: Curves.decelerate,
        )
        .animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1600.ms, color: neutral200, angle: 1.2);
  }
}
