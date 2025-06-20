import 'package:food_zone/exports.dart';

/// A custom button widget that displays a text label and handles user interactions.
///
/// The [FButton] widget is a stateless widget that creates an [ElevatedButton] with
/// customizable properties such as title, size, and onPressed callback.
///
/// The button's appearance and behavior can be customized using the provided parameters:
/// - [title]: The text label displayed on the button.
/// - [size]: A boolean value that determines the button's size.
/// - [onPressed]: A callback function that is triggered when the button is pressed.
class FButton extends StatelessWidget {
  const FButton({
    super.key,
    this.title = 'Button Name',
    this.onPressed,
    this.size = false,
  });

  final String title;
  final bool size;
  final Function()? onPressed;

  /// Builds the [FButton] widget.
  ///
  /// This method creates an [ElevatedButton] with the specified properties and styles.
  /// The button's appearance is customized using the [ElevatedButton.styleFrom] method,
  /// and the text label is displayed using a [Text] widget.
  ///
  /// @param context The build context in which the widget is built.
  /// @returns An [ElevatedButton] widget with the specified properties and styles.
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: primary500,
        minimumSize: size ? Size(context.w, context.heightByValue(52)) : null,
        elevation: .8,
        foregroundColor: primary900,
        shadowColor: primary500,
        disabledBackgroundColor: primary100,
        animationDuration: const Duration(seconds: 5),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: context.isPhone ? 18.sp : 11.sp,
          fontWeight: FontWeight.w600,
          color: primaryWhite,
        ),
      ),
    );
  }
}
