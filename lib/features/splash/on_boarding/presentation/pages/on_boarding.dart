import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/manager/controllers/pages.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/content.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static const List<String> pageImages = [
    FAssets.onBoarding1,
    FAssets.onBoarding2,
    FAssets.onBoarding3,
    FAssets.onBoarding4,
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> cardTitles = [
      context.translate.on_boarding_title1,
      context.translate.on_boarding_title2,
      context.translate.on_boarding_title3,
      context.translate.on_boarding_title4,
    ];

    final List<String> cardSubTitles = [
      context.translate.on_boarding_sup_title1,
      context.translate.on_boarding_sup_title2,
      context.translate.on_boarding_sup_title3,
      context.translate.on_boarding_sup_title4,
    ];

    final pageController = Get.put(OnBoardingPageController());
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SizedBox(
          width: context.w,
          height: context.h,
          child: PageView.builder(
            controller: pageController.pageController,
            onPageChanged: (page) {
              pageController.setPage(page);
            },
            itemCount: 4,
            itemBuilder: (context, page) {
              return OnBoardingContent(
                image: pageImages[page],
                title: cardTitles[page],
                subTitle: cardSubTitles[page],
              );
            },
          ),
        ),
      ),
    );
  }
}
