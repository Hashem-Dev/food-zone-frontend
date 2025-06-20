import 'package:food_zone/exports.dart';

/// A widget that displays the title for the registration screen.
///
/// This widget adjusts its width and text style based on the screen orientation.
/// If the screen width is greater than 600, it is considered landscape mode.
class RegisterTitle extends StatelessWidget {
  /// Creates a [RegisterTitle] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget in the widget tree.
  const RegisterTitle({super.key});

  /// Builds the [RegisterTitle] widget.
  ///
  /// This method constructs the widget tree for the title, adjusting its width and text style
  /// based on the screen orientation.
  ///
  /// @param context The build context for the widget.
  /// @returns A [SizedBox] containing the title text.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return SizedBox(
      width: isLandscape ? null : 250.w,
      child: Text(
        textAlign: TextAlign.start,
        context.translate.register_title,
        style: isLandscape
            ? context.textStyle.headlineMedium!
                .copyWith(color: primary500, fontSize: 15.sp)
            : context.textStyle.headlineMedium!.copyWith(color: primary500),
      ),
    );
  }
}
