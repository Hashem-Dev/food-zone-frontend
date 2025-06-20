import 'package:food_zone/exports.dart';

/// A widget that displays a message when the OTP email is not received.
///
/// This widget is used in the authentication flow to inform the user that
/// they have not received the OTP email. It displays a message in the center
/// of the screen with a specific text style based on the screen width.
class NotReceiveOtpPassword extends StatelessWidget {
  /// Creates a [NotReceiveOtpPassword] widget.
  const NotReceiveOtpPassword({super.key});

  /// Builds the widget tree for the [NotReceiveOtpPassword] widget.
  ///
  /// This method is called by the Flutter framework to build the widget tree.
  /// It uses the [BuildContext] to get the screen width and apply the appropriate
  /// text style to the message.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree that displays the message.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    return Center(
      child: Text(
        context.translate.email_otp_not_receive,
        style: context.textStyle.titleSmall!.copyWith(
          fontSize: width < 600 ? 16.sp : 9.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
