import 'package:food_zone/exports.dart';

class EmailTitle extends StatelessWidget {
  const EmailTitle({super.key});

  @override

  /// Builds the widget tree for the EmailTitle widget.
  ///
  /// This method constructs a [Text] widget that displays the translated
  /// "forgot password" text. The text style is adjusted based on the
  /// screen orientation (landscape or portrait).
  ///
  /// @param context The [BuildContext] in which the widget is built.
  /// @returns A [Text] widget displaying the "forgot password" text with
  ///          appropriate styling.
  ///
  /// The returned [Text] widget is used within a Flutter app to provide
  /// a localized and styled title for the email-related authentication
  /// screens, enhancing the user interface and user experience.
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text(
      context.translate.forgot_password,
      style: context.textStyle.headlineMedium!
          .copyWith(fontSize: isLandscape ? 15.sp : null),
    );
  }
}
