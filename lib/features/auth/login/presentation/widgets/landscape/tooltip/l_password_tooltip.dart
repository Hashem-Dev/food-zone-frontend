import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/landscape/l_tooltip/l_tooltip_span_message.dart';

/// A widget that displays a tooltip for password validation rules in the login screen.
///
/// This widget uses the [LoginPasswordController] to get the validation results
/// and displays a tooltip with messages indicating whether the password meets
/// the required rules.
///
/// The tooltip is always visible and contains messages for the following rules:
/// - Password length
/// - Password complexity
/// - Avoiding repetitions
class LPasswordTooltipLogin extends StatelessWidget {
  /// Creates an instance of [LPasswordTooltipLogin].
  const LPasswordTooltipLogin({super.key});

  /// Builds the widget tree for the tooltip.
  ///
  /// This method uses the [Get.put] method to initialize the [LoginPasswordController]
  /// and retrieves the validation results. It then constructs a [TooltipVisibility]
  /// widget that contains a [Tooltip] with the validation messages.
  ///
  /// @param context The build context for the widget.
  /// @returns A widget tree containing the tooltip.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginPasswordController());
    final result = controller.validationResult;
    return Obx(
      () => TooltipVisibility(
        visible: true,
        child: Tooltip(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          key: controller.tooltipKeyLogin,
          richMessage: TextSpan(children: [
            lTooltipSpanMessage(
              check: result[0],
              title: context.translate.password_rules_length,
            ),
            lTooltipSpanMessage(
              check: result[1] && result[3],
              title: context.translate.password_rules_complexity,
            ),
            lTooltipSpanMessage(
              check: result[4],
              title: context.translate.password_rules_avoid_repetitions,
            ),
          ]),
          child: const Icon(
            SolarIconsOutline.infoCircle,
            color: neutral100,
          ),
        ),
      ),
    );
  }
}
