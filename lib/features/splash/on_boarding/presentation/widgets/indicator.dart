import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/manager/controllers/pages.dart';

class ContentIndicator extends StatelessWidget {
  const ContentIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(OnBoardingPageController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          4,
          (index) => Obx(() {
            return AnimatedContainer(
              margin: EdgeInsets.symmetric(horizontal: 3.w),
              width: 24.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: pageController.page == index ? primaryWhite : primary100,
                borderRadius: BorderRadius.circular(100.r),
              ),
              duration: const Duration(milliseconds: 200),
            );
          }),
        ),
      ],
    );
  }
}
