import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/manager/controllers/pages.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Get.put(OnBoardingPageController());

    return TextButton.icon(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        iconColor: WidgetStateProperty.all(primaryWhite),
        iconSize: const WidgetStatePropertyAll(20),
      ),
      iconAlignment: IconAlignment.end,
      icon: const Icon(Icons.arrow_forward_rounded),
      label: Text(
        context.translate.on_boarding_next_btn,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14.sp,
          color: primaryWhite,
        ),
      ),
      onPressed: () {
        pageController.getNextSlide();
      },
    );
  }
}
