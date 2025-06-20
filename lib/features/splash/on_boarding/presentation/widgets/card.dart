import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/manager/controllers/pages.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/buttons/next.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/buttons/skip.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/buttons/start.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/indicator.dart';

class OnBoardingCard extends StatelessWidget {
  const OnBoardingCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  static const List<Color> cardColors = [
    primary500,
    primary600,
    primary700,
    primary800,
  ];

  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(OnBoardingPageController());

    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 550),
        height: 450.h,
        margin: EdgeInsets.symmetric(horizontal: 30.w),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        decoration: BoxDecoration(
          color: cardColors[pageController.page],
          borderRadius: BorderRadius.circular(48.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              title,
              style: TextStyle(
                color: primaryWhite,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(color: primaryWhite, fontSize: 20.sp)),
            const ContentIndicator(),
            pageController.page != 3
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [SkipButton(), NextButton()],
                  )
                : const CardStart()
          ],
        ),
      ),
    );
  }
}
