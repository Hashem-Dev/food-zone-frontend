import 'package:food_zone/exports.dart';

class SplashVersionText extends StatelessWidget {
  const SplashVersionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Version 1.2.0',
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: primaryWhite,
      ),
    ).animate().fadeIn(
          delay: const Duration(seconds: 6),
          duration: 1200.ms,
          curve: Curves.decelerate,
        );
  }
}
