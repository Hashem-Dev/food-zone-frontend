import '../../exports.dart';

/// A widget that displays a text with a line through it.
///
/// This widget is useful for showing text that is meant to be crossed out,
/// such as indicating a completed task or a discounted price.
///
/// The [TextLineThrough] widget takes a [text] parameter which is the string
/// to be displayed. It also allows customization of the [fontSize] and
/// [fontWeight] of the text.
///
/// Example usage:
/// ```dart
/// TextLineThrough(
///   text: 'Sample Text',
///   fontSize: 18,
///   fontWeight: FontWeight.bold,
/// )
/// ```
class TextLineThrough extends StatelessWidget {
  const TextLineThrough({
    super.key,
    required this.text,
    this.fontSize = 20,
    this.fontWeight = FontWeight.w400,
  });

  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  /// Builds the [TextLineThrough] widget.
  ///
  /// This method returns a [Text] widget with a line through the text.
  /// The text style is customized with the provided [fontSize] and [fontWeight].
  ///
  /// @returns A [Text] widget with a line through the text.
  ///
  /// The returned [Text] widget can be used within a Flutter app to display
  /// text that is meant to be crossed out. This can be useful in various
  /// scenarios such as indicating completed tasks, showing discounted prices,
  /// or any other context where strikethrough text is needed.
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        color: neutral200,
        fontWeight: fontWeight,
        fontSize: fontSize.sp,
      ),
    );
  }
}
