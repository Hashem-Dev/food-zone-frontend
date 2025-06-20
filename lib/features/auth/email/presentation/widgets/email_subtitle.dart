import 'package:food_zone/exports.dart';

class EmailSubtitle extends StatelessWidget {
  const EmailSubtitle({super.key});

  /// Builds a widget that displays a subtitle text for the email forgot password screen.
  ///
  /// The text displayed is translated based on the current locale and styled according to the
  /// current text theme. The font size is adjusted based on the screen orientation.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Text] widget displaying the subtitle text.
  ///
  /// The returned [Text] widget is used within a Flutter app to provide a localized and
  /// styled subtitle for the email forgot password screen, enhancing the user interface
  /// and user experience.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;

    return Text(
      context.translate.email_forgot_password_title,
      style: context.textStyle.headlineSmall!
          .copyWith(fontSize: isLandscape ? 8.sp : null),
    );
  }
}
