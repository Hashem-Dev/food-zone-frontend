import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/password.dart';
import 'package:food_zone/features/auth/register/presentation/widgets/portrait/tooltip/tooltip_span_message.dart';

/// A widget that displays a tooltip for password validation rules in the login screen.
///
/// This widget uses the [LoginPasswordController] to get the validation results
/// and displays a tooltip with messages indicating whether the password meets
/// the required rules.
///
/// The tooltip is displayed using the [TooltipVisibility] and [Tooltip] widgets.
class PPasswordTooltipLogin extends StatelessWidget {
  /// Creates a [PPasswordTooltipLogin] widget.
  ///
  /// The [key] parameter is optional and can be used to identify this widget.
  const PPasswordTooltipLogin({super.key});

  /// Builds the [PPasswordTooltipLogin] widget.
  ///
  /// This method uses the [Get.put] method to get an instance of the
  /// [LoginPasswordController] and observes the validation results using the
  /// [Obx] widget. The tooltip is displayed with messages indicating the
  /// password validation rules.
  ///
  /// @param context The build context.
  /// @returns A widget tree containing the tooltip for password validation rules.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginPasswordController());
    final result = controller.validationResult;
    return Obx(
      () => TooltipVisibility(
        visible: true,
        child: Tooltip(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          key: controller.tooltipKeyLogin,
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
      ),
    );
  }
}
