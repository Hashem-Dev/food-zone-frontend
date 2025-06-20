import 'package:food_zone/exports.dart';

class SplashAfterOpen extends StatelessWidget {
  const SplashAfterOpen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(
          textDirection: TextDirection.ltr,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(FAssets.logo2, width: 85.w, height: 85.w)
                .animate()
                .slideX(),
            addHorizontalSpace(15),
            Text(
              'Food Zone',
              style: TextStyle(
                fontSize: 45.sp,
                fontWeight: FontWeight.bold,
                color: primary500,
              ),
            )
                .animate()
                .fadeIn(
                    delay: 1000.ms, duration: 2000.ms, curve: Curves.decelerate)
                .animate(
                    onPlay: (controller) => controller.repeat(reverse: true))
                .shimmer(duration: 2000.ms, color: neutral50),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
