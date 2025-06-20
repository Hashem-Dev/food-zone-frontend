import '../../exports.dart';

/// A custom dropdown widget that provides a styled dropdown button with various customization options.
///
/// This widget is used to create a dropdown button with a specified list of items, a selected value,
/// and a callback function that is triggered when the selected value changes. It also allows customization
/// of the dropdown's width, hint text, and whether the dropdown is collapsed or not.
class AppDropDown extends StatelessWidget {
  const AppDropDown({
    super.key,
    this.items,
    this.value,
    this.onChanged,
    this.width = 108,
    this.isCollapsed = true,
    this.hint,
  });

  /// The list of items to be displayed in the dropdown menu.
  final List<DropdownMenuItem<String>>? items;

  /// The callback function that is triggered when the selected value changes.
  final void Function(String?)? onChanged;

  /// The currently selected value in the dropdown menu.
  final String? value;

  /// The width of the dropdown button.
  final double width;

  /// Whether the dropdown button is collapsed or not.
  final bool isCollapsed;

  /// The hint text to be displayed when no value is selected.
  final Widget? hint;

  @override

  /// Builds the dropdown button widget.
  ///
  /// This method creates a `DropdownButtonFormField` widget with the specified properties and styles.
  /// The dropdown button is wrapped in a `SizedBox` to control its width.
  ///
  /// @param context The build context.
  /// @returns A `Widget` that represents the dropdown button.
  Widget build(BuildContext context) {
    return SizedBox(
      key: GlobalKey(),
      width: context.widthByValue(width),
      child: DropdownButtonFormField<String>(
          key: GlobalKey(),
          isDense: true,
          hint: hint,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          decoration: InputDecoration(
            isCollapsed: isCollapsed,
            filled: true,
            fillColor: context.isDarkMode
                ? primaryWhite.withValues(alpha: .1)
                : primaryWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1,
                color: context.isDarkMode ? neutral400 : neutral100,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1,
                color: context.isDarkMode ? neutral400 : neutral100,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                width: 1,
                color: context.isDarkMode ? neutral400 : neutral100,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 5.h,
            ),
          ),
          style: context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
          icon: Icon(
            SolarIconsOutline.altArrowDown,
            color: context.textStyle.displaySmall!.color,
            size: 18.sp,
          ),
          items: items,
          value: value,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          }),
    );
  }
}
