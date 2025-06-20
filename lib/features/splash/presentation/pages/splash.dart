import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/pages/register.dart';
import 'package:food_zone/features/splash/data/repositories/load_user_data.dart';
import 'package:food_zone/features/splash/data/repositories/verify_token.dart';

import 'package:food_zone/features/splash/presentation/pages/splash_before_open.dart';
import 'package:food_zone/features/splash/presentation/widgets/language_choosing.dart';

import 'splash_after_open.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends State<SplashView> {
  final tokenController = Get.put(VerifyTokenController());
  final loadDataController = Get.put(LoadUserDataController());
  late bool showBottomData = false;
  final bool firstTimeOpen = prefs.openFirstTime;
  final String accessToken = prefs.accessToken;
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    Future.delayed(const Duration(seconds: 3),
        () => setState(() => showBottomData = true));

    Future.delayed(const Duration(seconds: 5), () {
      if (firstTimeOpen && accessToken.isNotEmpty) {
        tokenController.verifyToken();
        loadDataController.loadFavoriteRestaurant();
        loadDataController.loadFavoriteMeals();
      } else {
        Future.delayed(
            const Duration(seconds: 6), () => showLanguageSelector());
      }
    });

    if (firstTimeOpen) {
      final isDarkMode = brightness == Brightness.dark;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: isDarkMode ? neutral900 : primaryWhite,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          systemNavigationBarColor: splashBackground,
          statusBarColor: splashBackground,
        ),
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    final isDarkMode = brightness == Brightness.dark;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: isDarkMode ? neutral900 : primaryWhite,
      ),
    );

    super.dispose();
  }

  void showLanguageSelector() async {
    if (!firstTimeOpen) {
      prefs.setOpenFirstTime();
      await showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return const LanguageChoosing();
          });
    } else {
      Get.offAll(() => const RegisterView());
    }
  }

  @override
  Widget build(BuildContext context) {
    return firstTimeOpen
        ? const SplashAfterOpen()
        : SplashBeforeOpen(showBottomData: showBottomData);
  }
}
