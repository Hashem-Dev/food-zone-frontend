import 'package:food_zone/exports.dart';

class SplashSubTitle extends StatelessWidget {
  const SplashSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 241.w,
      child: Text(
        context.translate.splash_sub_title,
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: primaryWhite,
        ),
        textAlign: TextAlign.center,
      ).animate().fadeIn(
            duration: const Duration(seconds: 2),
          ),
    );
  }
}
//ddd
