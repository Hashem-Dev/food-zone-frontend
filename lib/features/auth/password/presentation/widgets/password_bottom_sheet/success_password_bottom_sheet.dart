import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/pages/login.dart';

/// Displays a modal bottom sheet indicating that the password has been successfully updated.
///
/// This function shows a modal bottom sheet with a success message and an illustration.
/// It also provides a button to navigate back to the login view and clear saved preferences.
///
/// @param context The BuildContext in which the bottom sheet is displayed.
/// @returns A Future that completes when the bottom sheet is dismissed.
///
/// Example usage:
/// ```dart
/// showSuccessUpdatedPassword(context);
/// ```
Future showSuccessUpdatedPassword(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isDismissible: false,
      backgroundColor: context.appTheme.scaffoldBackgroundColor,
      isScrollControlled: false,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: !context.isPhone ? 320.h : 350.h,
          width: !context.isPhone ? 200.w : context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                FAssets.passwordChanged,
                width: !context.isPhone ? 80.w : null,
              ),
              Text(
                context.translate.bottom_sheet_password_changed,
                style: context.textStyle.headlineMedium!
                    .copyWith(fontSize: !context.isPhone ? 12.sp : null),
              ),
              Text(
                textAlign: TextAlign.center,
                context.translate.bottom_sheet_password_changed_title,
                style: context.textStyle.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: !context.isPhone ? 6.sp : null,
                ),
              ),
              FButton(
                size: true,
                title: context.translate.bottom_sheet_btn_name,
                onPressed: () {
                  Get.offAll(() {
                    const LoginView();
                  });
                },
              )
            ],
          ),
        );
      });
}
