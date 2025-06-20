import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/landscape/l_tooltip/l_tooltip_span_message.dart';

/// A widget that displays a tooltip for password validation rules.
///
/// This widget uses the `PasswordController` to get the validation results
/// and displays a tooltip with messages indicating whether the password
/// meets the required rules.
class LPasswordTooltip extends StatelessWidget {
  /// Creates an instance of [LPasswordTooltip].
  const LPasswordTooltip({super.key});

  /// Builds the widget tree for the tooltip.
  ///
  /// @param context The build context.
  /// @returns A widget tree containing the tooltip.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());
    final result = controller.validationResult;
    return Obx(
      () => TooltipVisibility(
        visible: true,
        child: Tooltip(
          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 5.h),
          key: controller.tooltipKey,
          richMessage: TextSpan(
            children: [
              lTooltipSpanMessage(
                  check: result[0],
                  title: context.translate.password_rules_length),
              const TextSpan(text: '\n'),
              lTooltipSpanMessage(
                  check: result[1] && result[3],
                  title: context.translate.password_rules_complexity),
              const TextSpan(text: '\n'),
              lTooltipSpanMessage(
                  check: result[4],
                  title: context.translate.password_rules_avoid_repetitions),
            ],
          ),
          child: const Icon(
            SolarIconsOutline.infoCircle,
            color: neutral100,
          ),
        ),
      ),
    );
  }
}
