import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/portrait/tooltip/tooltip_span_message.dart';

/// A widget that displays a tooltip for password validation rules.
///
/// This widget uses the `PasswordController` to get the validation results
/// and displays a tooltip with messages indicating whether the password
/// meets the required rules.
///
/// The tooltip is always visible and contains messages for the following rules:
/// - Password length
/// - Password complexity
/// - Avoiding repetitions
class PasswordTooltip extends StatelessWidget {
  /// Creates a new instance of [PasswordTooltip].
  const PasswordTooltip({super.key});

  /// Builds the widget tree for the password tooltip.
  ///
  /// This method uses the `PasswordController` to get the validation results
  /// and constructs a tooltip with messages based on these results.
  ///
  /// @param context The build context.
  /// @returns A widget tree containing the password tooltip.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());
    final result = controller.validationResult;
    return Obx(() => TooltipVisibility(
          visible: true,
          child: Tooltip(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            key: controller.tooltipKey,
            richMessage: TextSpan(children: [
              tooltipSpanMessage(
                check: result[0],
                title: context.translate.password_rules_length,
              ),
              tooltipSpanMessage(
                check: result[1] && result[3],
                title: context.translate.password_rules_complexity,
              ),
              tooltipSpanMessage(
                check: result[4],
                title: context.translate.password_rules_avoid_repetitions,
              ),
            ]),
            child: const Icon(
              SolarIconsOutline.infoCircle,
              color: neutral100,
            ),
          ),
        ));
  }
}
