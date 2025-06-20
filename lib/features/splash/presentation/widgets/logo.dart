import 'package:food_zone/exports.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 181.w,
      height: 170.h,
      child: SvgPicture.asset(FAssets.logo),
    )
        .animate()
        .scale(
          delay: const Duration(seconds: 3),
          duration: 501.ms,
        )
        .move(
          delay: const Duration(seconds: 4),
          duration: 300.ms,
          begin: const Offset(0, 300),
          end: const Offset(0, 100),
        );
  }
}
