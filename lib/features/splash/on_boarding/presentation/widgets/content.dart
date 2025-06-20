import 'package:flutter/services.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/card.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/widgets/image.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: context.appTheme.scaffoldBackgroundColor,
        statusBarColor: context.appTheme.scaffoldBackgroundColor));
    return Column(
      children: [
        addVerticalSpace(72),
        OnBoardingImage(image),
        addVerticalSpace(48),
        OnBoardingCard(title: title, subTitle: subTitle)
      ],
    );
  }
}
