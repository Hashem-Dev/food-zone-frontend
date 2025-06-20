import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/phone/presentation/pages/phone_otp.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/phone_subtitle.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/phone_title.dart';
import 'package:food_zone/features/auth/phone/presentation/widgets/portrait/p_phone_text_field.dart';

/// A stateless widget that represents the portrait layout for the phone authentication screen.
class PortraitPhone extends StatelessWidget {
  /// Creates a [PortraitPhone] widget.
  const PortraitPhone({super.key});

  /// Builds the widget tree for the portrait phone authentication screen.
  ///
  /// This method constructs a column layout containing the phone title, subtitle,
  /// text field for phone number input, and a button to proceed to the phone verification code screen.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] representing the portrait phone authentication screen.
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        addVerticalSpace(16),
        const PhoneTitle(),
        addVerticalSpace(8),
        const PhoneSubtitle(),
        addVerticalSpace(32),
        const PhoneTextField(),
        const Expanded(child: SizedBox.shrink()),
        FButton(
          title: context.translate.bottom_sheet_btn_name,
          onPressed: () => Get.to(
            () => const PhoneVerificationCode(),
            preventDuplicates: true,
          ),
        ),
        addVerticalSpace(16),
      ],
    );
  }
}
