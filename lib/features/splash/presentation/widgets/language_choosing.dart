import 'package:flutter/cupertino.dart';
import 'package:food_zone/core/controllers/preferences.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/on_boarding/presentation/pages/on_boarding.dart';

class LanguageChoosing extends StatelessWidget {
  const LanguageChoosing({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActionSheet(
        title: Text(context.translate.choose_language),
        message: SizedBox(
          width: context.w,
          child: Column(
            children: [
              LanguageActionSheet(
                code: Get.deviceLocale!.languageCode,
                title: context.translate.device_language,
              ),
              LanguageActionSheet(code: 'ar', title: context.translate.arabic),
              LanguageActionSheet(code: 'en', title: context.translate.english),
              CupertinoActionSheetAction(
                  child: Text(context.translate.cancel),
                  onPressed: () {
                    Get.back();
                    Get.to(
                      () => const OnBoardingView(),
                      fullscreenDialog: true,
                      transition: Transition.circularReveal,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageActionSheet extends StatelessWidget {
  const LanguageActionSheet({
    super.key,
    required this.title,
    required this.code,
  });

  final String title;
  final String code;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PreferencesController());
    return CupertinoActionSheetAction(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: context.textStyle.headlineSmall!.fontFamily,
          ),
        ),
        onPressed: () {
          controller.changeLanguage(code);
          Get.to(
            () => const OnBoardingView(),
            fullscreenDialog: true,
            transition: Transition.circularReveal,
          );
        });
  }
}
