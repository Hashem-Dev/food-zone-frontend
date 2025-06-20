import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/bottom_sheet.dart';
import 'package:food_zone/features/auth/login/presentation/widgets/portrait/password_bottom_sheet/bottom_sheet_card.dart';
import 'package:food_zone/features/auth/phone/presentation/pages/phone.dart';
import 'package:food_zone/features/auth/phone/presentation/pages/phone_otp.dart';

/// Displays a modal bottom sheet for password-related actions.
///
/// This function shows a modal bottom sheet that allows users to choose between
/// phone and email options for password recovery. It uses the `BottomSheetController`
/// to manage the state and actions within the bottom sheet.
///
/// @param context The BuildContext to show the bottom sheet.
/// @returns A Future that completes when the bottom sheet is dismissed.
Future<void> showPasswordBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    showDragHandle: true,
    barrierColor: neutral900.withValues(alpha: .8),
    isDismissible: true,
    isScrollControlled: true,
    sheetAnimationStyle: AnimationStyle(
      duration: const Duration(milliseconds: 300),
    ),
    backgroundColor: context.appTheme.scaffoldBackgroundColor,
    builder: (BuildContext context) {
      final controller = Get.put(BottomSheetController());

      return Obx(
        () => controller.loading
            ? SizedBox(height: 200.h, child: const Loading())
            : Container(
                width: context.isLandscape ? context.width / 2 : context.width,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Title of the bottom sheet.
                    Text(
                      context.translate.bottom_sheet_title,
                      style: context.textStyle.headlineMedium!.copyWith(
                          fontSize: context.isLandscape ? 11.sp : null),
                    ),
                    addVerticalSpace(context.isLandscape ? 6 : 12),

                    /// Subtitle of the bottom sheet.
                    Text(
                      context.translate.bottom_sheet_sub_title,
                      style: context.textStyle.headlineSmall!.copyWith(
                          fontSize: context.isLandscape ? 7.sp : null),
                    ),
                    addVerticalSpace(context.isLandscape ? 12 : 24),

                    /// Card for phone option.
                    BottomSheetCard(
                      title: context.translate.bottom_sheet_phone,
                      subtitle: prefs.userPhone.isEmpty
                          ? context.translate.bottom_sheet_phone_required
                          : prefs.userPhone,
                      icon: SolarIconsOutline.chatDots,
                      sendType: 'message',
                    ),
                    addVerticalSpace(context.isLandscape ? 12 : 24),

                    /// Card for email option.
                    BottomSheetCard(
                      title: context.translate.bottom_sheet_email,
                      subtitle: prefs.userEmail.isEmpty
                          ? context.translate.bottom_sheet_email_required
                          : prefs.userEmail,
                      icon: SolarIconsOutline.letter,
                      sendType: 'email',
                    ),
                    addVerticalSpace(24),

                    /// Button to proceed with the selected option.
                    FButton(
                      size: true,
                      title: context.translate.bottom_sheet_btn_name,
                      onPressed: () async {
                        final email = prefs.userEmail;
                        final phone = prefs.userPhone;

                        if (controller.selectedSendType == 'message') {
                          if (phone.isEmpty) {
                            // Navigate to enter phone number view
                            Get.to(() => const PhoneNumberView());
                          } else {
                            // Navigate to enter verification phone password
                            Get.to(() => const PhoneVerificationCode());
                          }
                        } else if (controller.selectedSendType == 'email') {
                          if (email.isEmpty) {
                            // Navigate to enter email view
                            Get.to(() => const EmailView());
                          } else {
                            // Send OTP to email
                            await controller.sendOTPWithEmail(email);
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
      );
    },
  );
}
