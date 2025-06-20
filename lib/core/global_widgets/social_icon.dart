import 'package:food_zone/exports.dart';

/// A widget that represents a Google authentication button.
///
/// This widget displays a button with the Google logo and the text "Google".
/// It is styled with a border and rounded corners, and is intended to be used
/// as a part of the authentication flow in a Flutter application.
class GoogleAuth extends StatelessWidget {
  const GoogleAuth({super.key});

  /// Builds the Google authentication button widget.
  ///
  /// This method constructs the UI for the Google authentication button,
  /// including its size, decoration, and child elements (logo and text).
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Container] widget that contains the styled Google authentication button.
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(345),
      height: context.widthByValue(50),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: neutral200),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: Container(
        margin: EdgeInsets.all(2.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: context.widthByValue(10),
          children: [
            SvgPicture.asset(FAssets.google, width: 27.w),
            Text(
              'Google',
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 22.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
