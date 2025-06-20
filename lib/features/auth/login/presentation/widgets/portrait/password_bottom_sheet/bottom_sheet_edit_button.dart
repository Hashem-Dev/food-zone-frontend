import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/email/presentation/pages/email.dart';
import 'package:food_zone/features/auth/phone/presentation/pages/phone.dart';

/// A widget that displays an edit button inside a bottom sheet.
///
/// The button navigates to different views based on the [sendType] provided.
///
/// {@tool snippet}
/// This example shows how to use the [BottomSheetEditButton] widget.
///
/// ```dart
/// BottomSheetEditButton(sendType: 'email');
/// ```
/// {@end-tool}
class BottomSheetEditButton extends StatelessWidget {
  /// Creates a [BottomSheetEditButton] widget.
  ///
  /// The [sendType] parameter determines the navigation target when the button is pressed.
  const BottomSheetEditButton({super.key, required this.sendType});

  /// The type of sending method, either 'email' or 'message'.
  final String sendType;

  @override
  Widget build(BuildContext context) {
    final width = context.w;
    return IconButton(
      /// Navigates to the appropriate view based on the [sendType].
      ///
      /// If [sendType] is 'email', navigates to [EmailView].
      /// If [sendType] is 'message', navigates to [PhoneNumberView].
      onPressed: () {
        if (sendType == 'email') {
          Get.to(() => const EmailView());
        } else if (sendType == 'message') {
          Get.to(() => const PhoneNumberView());
        }
      },
      icon: Container(
        width: width < 600 ? 44.w : 22.w,
        height: width < 600 ? 44.w : 22.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: primary500.withValues(alpha: .1),
        ),
        child: const Icon(SolarIconsOutline.pen2),
      ),
    ).animate().slideX(duration: const Duration(milliseconds: 150));
  }
}
