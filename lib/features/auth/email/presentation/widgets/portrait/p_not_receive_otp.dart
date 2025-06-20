import 'package:food_zone/exports.dart';

class NotReceiveOtp extends StatelessWidget {
  const NotReceiveOtp({super.key});

  /// Builds the widget tree for the NotReceiveOtp widget.
  ///
  /// This method constructs a [Center] widget containing a [Text] widget
  /// that displays a message indicating that the OTP email was not received.
  /// The text style is dynamically adjusted based on the screen width to
  /// provide an optimal viewing experience in both portrait and landscape modes.
  ///
  /// @param context The [BuildContext] in which the widget is built.
  /// @returns A [Widget] tree containing the [Center] and [Text] widgets.
  ///
  /// The returned [TextTheme] is used within a Flutter app to style the text
  /// displayed in the [Text] widget. It ensures that the text appearance
  /// is consistent with the app's overall theme and adapts to different
  /// screen sizes and orientations.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Center(
      child: Text(
        context.translate.email_otp_not_receive,
        style: context.textStyle.titleSmall!.copyWith(
          fontSize: isLandscape ? 9.sp : 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
