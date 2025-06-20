import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/phone/presentation/pages/phone_otp.dart';

import '../widgets/phone_subtitle.dart';
import '../widgets/phone_title.dart';
import '../widgets/portrait/p_phone_text_field.dart';

/// A stateless widget that represents the landscape layout for the phone authentication screen.
class LandscapePhone extends StatelessWidget {
  /// Creates a [LandscapePhone] widget.
  const LandscapePhone({super.key});

  /// Builds the widget tree for the landscape phone authentication screen.
  ///
  /// This method constructs the UI elements for the landscape layout, including
  /// the phone title, subtitle, text field, and a button to navigate to the phone
  /// verification code screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the landscape phone authentication screen.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(child: SizedBox.shrink()),
                const PhoneTitle(),
                addVerticalSpace(8),
                const PhoneSubtitle(),
                const Expanded(flex: 2, child: SizedBox.shrink()),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  const PhoneTextField(),
                  addVerticalSpace(15),
                  FButton(
                    title: context.translate.bottom_sheet_btn_name,
                    onPressed: () => Get.to(
                      () => const PhoneVerificationCode(),
                      preventDuplicates: true,
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox.shrink()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
