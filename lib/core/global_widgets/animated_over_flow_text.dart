import 'package:auto_scroll_text/auto_scroll_text.dart';

import '../../exports.dart';

/// A widget that displays text with an animation if it overflows its container.
///
/// If the text fits within the container, it is displayed normally with an ellipsis
/// if it overflows. If the text does not fit, it will scroll horizontally.
///
/// The scrolling text is animated using the [AutoScrollText] widget.
class OverFlowAnimatedText extends StatelessWidget {
  /// Creates an [OverFlowAnimatedText] widget.
  ///
  /// The [text] parameter is required and specifies the text to display.
  /// The [textStyle] parameter is optional and specifies the style to use for the text.
  const OverFlowAnimatedText({super.key, required this.text, this.textStyle});

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final TextDirection textDirection =
        context.language == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    return LayoutBuilder(builder: (context, constraints) {
      final isTextOverFlow = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: textDirection,
        maxLines: 1,
      )..layout(maxWidth: constraints.maxWidth);

      return isTextOverFlow.didExceedMaxLines
          ? AutoScrollText(
              text,
              style: textStyle,
              velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
              textAlign: TextAlign.start,
              intervalSpaces: 10,
              scrollDirection: Axis.horizontal,
              mode: AutoScrollTextMode.endless,
              numberOfReps: 5,
              selectable: false,
            )
          : Text(
              text,
              style: textStyle,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            );
    });
  }
}
