import '../../exports.dart';

class RateButton extends StatelessWidget {
  const RateButton({super.key, required this.page});

  final Widget page;

  @override

  /// Builds the RateButton widget.
  ///
  /// This method constructs an [ElevatedButton] that navigates to the specified [page] when pressed.
  /// The button is styled with custom padding, size, and decoration. It contains a text label "Rate"
  /// and an icon inside a [CircleAvatar].
  ///
  /// @param context The build context in which the widget is built.
  /// @returns A widget tree representing the RateButton.
  ///
  /// The returned [Widget] is used within a Flutter app to provide a button that navigates to a rating page.
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => page);
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        minimumSize: Size(40.w, 10.h),
        maximumSize: Size(73.w, 60.h),
      ),
      child: Container(
        padding: EdgeInsetsDirectional.fromSTEB(5.w, 1.h, 1.w, 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(77.r),
          border: Border.all(width: 1, color: primary500),
          color: context.isDarkMode ? primary500 : context.background,
        ),
        child: Row(
          children: <Widget>[
            Text(
              'Rate',
              style: context.textStyle.titleLarge!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            addHorizontalSpace(5),
            CircleAvatar(
              backgroundColor: context.isDarkMode ? neutral500 : primary500,
              radius: 13.r,
              child: Icon(
                SolarIconsBold.stars1,
                size: 18.sp,
                color: primaryWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
