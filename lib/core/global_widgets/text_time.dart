import '../../exports.dart';

/// A widget that displays a meal time with an icon and text.
///
/// The [TextTime] widget is used to display a meal time with an accompanying
/// clock icon. It is typically used in meal planning or food-related apps
/// to indicate the time for a specific meal.
///
/// The widget takes the following parameters:
/// - [mealTime]: A string representing the meal time to be displayed.
/// - [iconSize]: The size of the clock icon. Defaults to 12.
/// - [fontSize]: The font size of the meal time text. Defaults to 12.
/// - [space]: The space between the icon and the text. Defaults to 2.
///
/// The widget returns a [Row] containing an [Icon] and a [Text] widget.
///
/// @returns A [Row] widget that displays a clock icon and a meal time text.
class TextTime extends StatelessWidget {
  const TextTime({
    super.key,
    required this.mealTime,
    this.iconSize = 12,
    this.fontSize = 12,
    this.space = 2,
  });

  final String mealTime;
  final double iconSize;
  final double fontSize;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          SolarIconsOutline.clockCircle,
          color: neutral100,
          size: iconSize.sp,
        ),
        addHorizontalSpace(space),
        SizedBox(
          child: Text(
            mealTime,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: neutral100,
              fontSize: fontSize.sp,
            ),
          ),
        ),
      ],
    );
  }
}
