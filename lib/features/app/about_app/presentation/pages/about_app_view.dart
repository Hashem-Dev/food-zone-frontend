import 'package:food_zone/exports.dart';

class AboutAppView extends StatelessWidget {
  const AboutAppView({super.key});

  /// Builds the widget tree for the AboutAppView.
  ///
  /// This method constructs the UI for the "About App" page, which includes
  /// an app bar, a gradient background, and various text elements displaying
  /// information about the app such as its name, version, and copyright.
  ///
  /// @param context The BuildContext in which the widget is built.
  /// @returns A [Scaffold] widget containing the entire "About App" page layout.
  ///
  /// The returned [Scaffold] widget is used within a Flutter app to display
  /// the "About App" page, providing users with information about the app.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'About app',
          style: TextStyle(
            color: neutral900,
            fontWeight: FontWeight.w700,
            fontSize: 22.sp,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [primary500, primary400],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        width: context.width,
        height: context.height,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 1),
              SvgPicture.asset(FAssets.logo),
              const Spacer(flex: 1),
              Text(
                'FOOD ZONE',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w900,
                  color: neutral900,
                ),
              ),
              Text(
                'Version 2.1.0',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: neutral900,
                ),
              ),
              const Spacer(flex: 4),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Copyright © 2025  ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16.sp,
                        color: neutral900,
                      ),
                    ),
                    TextSpan(
                      text: '(Hashem Wanous)',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: neutral900,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'All rights reserved.',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: neutral900,
                  fontWeight: FontWeight.w300,
                ),
              ),
              addVerticalSpace(25),
            ],
          ),
        ),
      ),
    );
  }
}
