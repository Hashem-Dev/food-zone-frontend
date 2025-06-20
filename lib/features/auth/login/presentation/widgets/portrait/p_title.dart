import 'package:food_zone/exports.dart';

/// A stateless widget that displays the login title.
///
/// This widget adjusts its width and font size based on the screen orientation.
/// If the screen width is greater than 600, it is considered landscape mode.
class LoginTitle extends StatelessWidget {
  /// Creates a [LoginTitle] widget.
  const LoginTitle({super.key});

  /// Builds the [LoginTitle] widget.
  ///
  /// This method determines the screen width and adjusts the width and font size
  /// of the title text accordingly.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [SizedBox] containing the title text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;

    return SizedBox(
      width: isLandscape ? null : 300.w,
      child: Text(
        textAlign: TextAlign.start,
        context.translate.login_title,
        style: context.textStyle.headlineMedium!.copyWith(
          color: primary500,
          fontSize: isLandscape ? 14.sp : null,
        ),
      ),
    );
  }
}
