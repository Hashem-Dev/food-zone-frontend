import 'package:food_zone/exports.dart';

/// A widget that displays a title with a gradient effect.
///
/// The gradient is applied to the text using a [ShaderMask] widget.
/// The gradient colors are defined by [primary500] and [primary400].
class GradientAppbarTitle extends StatelessWidget {
  /// Creates a [GradientAppbarTitle] widget.
  ///
  /// The [title] parameter must not be null.
  const GradientAppbarTitle({super.key, required this.title});

  /// The title text to display.
  final String title;

  @override

  /// Builds the [GradientAppbarTitle] widget.
  ///
  /// This method applies a linear gradient to the title text using a [ShaderMask].
  ///
  /// @param context The build context.
  /// @returns A [ShaderMask] widget that contains the gradient title text.
  ///
  /// The returned [ShaderMask] widget can be used within a Flutter app to display
  /// a title with a gradient effect in an app bar or any other part of the UI.
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [primary500, primary400],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
