import 'package:food_zone/exports.dart';

/// A widget that displays a horizontal line with a centered text.
///
/// This widget is typically used to visually separate sections of content
/// with a line and a label in the middle. The label text is provided via
/// the [title] parameter.
class OrWithWidget extends StatelessWidget {
  const OrWithWidget({super.key, required this.title});

  final String title;

  /// Builds the widget tree for the [OrWithWidget].
  ///
  /// This method constructs a [SingleChildScrollView] containing a [Row]
  /// with two [Expanded] widgets that create horizontal lines and a [Container]
  /// in the middle that displays the [title] text.
  ///
  /// The [Text] widget uses a [TextStyle] that adapts its font size based on
  /// the device's orientation.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A [Widget] tree that represents the [OrWithWidget].
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Expanded(child: Container(height: .5, color: primaryLine)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18.w),
            child: Text(
              title,
              style: TextStyle(
                color: primaryLine,
                fontSize: context.isLandscape ? 8.sp : 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(child: Container(height: .5, color: primaryLine)),
        ],
      ),
    );
  }
}
