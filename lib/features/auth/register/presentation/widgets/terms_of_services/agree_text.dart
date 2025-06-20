import 'package:flutter/gestures.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/app/terms_of_service/presentation/pages/privacy_policy.dart';
import 'package:food_zone/features/app/terms_of_service/presentation/pages/terms_of_services.dart';

/// A widget that displays a text with links to the Terms of Service and Privacy Policy.
///
/// This widget is used in the registration screen to inform users that by registering,
/// they agree to the Terms of Service and Privacy Policy. The text contains clickable
/// links that navigate to the respective pages when tapped.
class AgreeTextWidget extends StatelessWidget {
  /// Creates an [AgreeTextWidget].
  const AgreeTextWidget({super.key});

  /// Builds the widget tree for the [AgreeTextWidget].
  ///
  /// @param context The build context.
  /// @returns A [Text.rich] widget containing the agreement text with clickable links.
  @override
  Widget build(BuildContext context) {
    final width = context.w;
    final isLandscape = width > 600;
    return Text.rich(
      style: context.textStyle.titleSmall!.copyWith(
        fontSize: isLandscape ? 6.sp : null,
      ),
      TextSpan(
        children: [
          TextSpan(text: context.translate.agree_with),
          TextSpan(
            text: context.translate.term_of_service,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(() => const TermsOfServices());
              },
            style: const TextStyle(
              color: primary400,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(text: context.translate.and),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(() => const PrivacyPolicy());
              },
            text: context.translate.privacy_policy,
            style: const TextStyle(
              color: primary400,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
