import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/presentation/widgets/cover.dart';
import 'package:food_zone/features/splash/presentation/widgets/logo.dart';
import 'package:food_zone/features/splash/presentation/widgets/progress_indicator.dart';
import 'package:food_zone/features/splash/presentation/widgets/sub_title.dart';
import 'package:food_zone/features/splash/presentation/widgets/title.dart';
import 'package:food_zone/features/splash/presentation/widgets/version_text.dart';

class SplashBeforeOpen extends StatelessWidget {
  const SplashBeforeOpen({super.key, required this.showBottomData});

  final bool showBottomData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashBackground,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const SplashCover(),
            Positioned(
              child: SizedBox(
                height: context.h,
                width: context.w,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        const SplashLogo(),
                        addVerticalSpace(90),
                        const SplashTitle(),
                        const SplashVersionText()
                      ]),
                      showBottomData
                          ? const Column(children: [
                              SplashSubTitle(),
                              SplashProgressIndicator()
                            ])
                          : const SizedBox.shrink()
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
