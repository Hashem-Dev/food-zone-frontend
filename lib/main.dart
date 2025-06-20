import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_zone/config/theme/theme.dart';
import 'package:food_zone/core/controllers/preferences.dart';
import 'package:food_zone/core/services/notification.dart';
import 'package:food_zone/core/utils/cache_setting.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/splash/presentation/pages/splash.dart';

import 'generated/l10n.dart';

late CacheSetting prefs;
final preferencesController = Get.put(PreferencesController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51Q3alf2Lwx9F6iijKTT50Oky9YXkWzIosxQHpv6TaXY9OLgZ4LywRgBwQxqqIXVz17Oc4SKK7Am2jUzYAn09goud00lSOMai2p';

  prefs = await CacheSetting.getInstance();
  await NotificationService.notificationInit();
  await NotificationService.requestNotificationPermission();
  await requestLocationPermission();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(prefs.deviceAuthKey);
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          final language = prefs.userLanguage;

          return Obx(() {
            return GetMaterialApp(
              useInheritedMediaQuery: true,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: Locale(language),
              title: 'Food Zone',
              themeMode: preferencesController.themeMode.value,
              home: const SplashView(),
              theme: FAppTheme.lightTheme(language, context),
              darkTheme: FAppTheme.darkTheme(language, context),
              defaultTransition: Transition.fadeIn,
            );
          });
        });
  }
}

Future<void> requestLocationPermission() async {
  var status = await Permission.location.request();
  if (status.isGranted) {
  } else {}
}
