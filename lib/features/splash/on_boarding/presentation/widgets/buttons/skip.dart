import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/manager/controllers/pages.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingController = Get.put(OnBoardingPageController());
    return GestureDetector(
      onTap: () => onBoardingController.getLastSlide(),
      child: Text(
        context.translate.on_boarding_skip_btn,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: primaryWhite,
        ),
      ),
    );
  }
}
