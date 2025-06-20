import 'package:food_zone/exports.dart';

/// Displays a success snackbar with a custom message.
///
/// The snackbar is styled with a green check icon and a custom background color.
/// The width and icon size adjust based on the screen orientation.
///
/// @param text The message to display in the snackbar.
void showSuccessSnackBar(String text) {
  final width = Get.context!.w;
  final isLandscape = width > 600;
  Get.snackbar(
    '',
    '',
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.symmetric(
        horizontal: isLandscape ? 50.w : 16.w, vertical: 25.h),
    borderRadius: 12.r,
    backgroundColor: snackBarBackground,
    titleText: SizedBox(
      width: isLandscape ? null : 400.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              SolarIconsBold.checkCircle,
              color: green500,
              size: isLandscape ? 12.sp : 24.sp,
            ),
            addHorizontalSpace(isLandscape ? 4.w : 16.w),
            SizedBox(
              width: isLandscape ? null : 300.w,
              child: Text(
                text,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: isLandscape ? 8.sp : 14.sp,
                  color: neutral900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    ),
    messageText: const SizedBox.shrink(),
  );
}

/// Displays an error snackbar with a custom message.
///
/// The snackbar is styled with a red close icon and a custom background color.
/// The width and icon size adjust based on the screen orientation.
///
/// @param text The message to display in the snackbar.
void showErrorSnackBar(String text) {
  final width = Get.context!.w;
  final isLandscape = width > 600;
  Get.snackbar(
    '',
    '',
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.symmetric(
      horizontal: isLandscape ? 50.w : 16.w,
      vertical: 25.h,
    ),
    borderRadius: 12.r,
    backgroundColor: primary300.withValues(alpha: .4),
    titleText: SizedBox(
      width: isLandscape ? null : 400.w,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Icon(
              SolarIconsBold.closeCircle,
              color: primary600,
              size: isLandscape ? 12.sp : 24.sp,
            ),
            addHorizontalSpace(isLandscape ? 4.w : 16.w),
            SizedBox(
              width: isLandscape ? null : 300.w,
              child: Text(
                text,
                softWrap: true,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: isLandscape ? 8.sp : 14.sp,
                  color: neutral900,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    ),
    messageText: const SizedBox.shrink(),
  );
}

/// Displays a custom snackbar with an action button.
///
/// The snackbar includes a label, content text, and an action button that triggers a callback function when pressed.
/// The snackbar is styled with a rounded rectangle shape and adjusts its background color based on the theme mode.
///
/// @param context The BuildContext to display the snackbar.
/// @param label The label for the action button.
/// @param contentText The message to display in the snackbar.
/// @param onPressed The callback function to execute when the action button is pressed.
/// @returns A Future that completes with the ScaffoldFeatureController of the displayed snackbar.
Future<ScaffoldFeatureController<SnackBar, SnackBarClosedReason>> appSnackBar(
  BuildContext context, {
  String label = 'label',
  String contentText = 'Content Text',
  required Function onPressed,
}) async {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.r),
    ),
    action: SnackBarAction(
      label: label,
      textColor: primary500,
      onPressed: () async => await onPressed(),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: context.isDarkMode ? neutral500 : primaryWhite,
    dismissDirection: DismissDirection.horizontal,
    content: Text(
      contentText,
      style: context.textStyle.displayLarge!.copyWith(
        fontSize: 16.sp,
      ),
    ),
  ));
}
