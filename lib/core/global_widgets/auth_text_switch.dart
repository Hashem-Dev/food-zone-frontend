import 'package:flutter/gestures.dart';
import 'package:food_zone/exports.dart';

/// A widget that displays a switchable text with a clickable button text.
///
/// The [AuthTextSwitch] widget is used to display a text followed by a clickable button text.
/// This is typically used in authentication screens to switch between login and signup forms.
///
/// The [text] parameter is the main text displayed.
/// The [textBtn] parameter is the clickable button text.
/// The [onTap] parameter is the callback function that is triggered when the button text is clicked.
class AuthTextSwitch extends StatelessWidget {
  const AuthTextSwitch({
    super.key,
    required this.text,
    required this.textBtn,
    this.onTap,
  });

  final String text;
  final String textBtn;
  final Function()? onTap;

  /// Builds the [AuthTextSwitch] widget.
  ///
  /// This method creates a [RichText] widget that displays the [text] and [textBtn] with different styles.
  /// The [textBtn] is clickable and triggers the [onTap] callback when clicked.
  ///
  /// @param context The build context.
  /// @returns A [SizedBox] containing the [RichText] widget.
  ///
  /// The returned [RichText] widget is used within a Flutter app to display styled text with clickable elements.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;

    return SizedBox(
      width: context.w,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: isLandscape ? 8.sp : 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()..onTap = onTap,
              text: textBtn,
              style: context.textStyle.headlineSmall!.copyWith(
                fontSize: isLandscape ? 8.sp : 16.sp,
                fontWeight: FontWeight.w600,
                color: primary500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
