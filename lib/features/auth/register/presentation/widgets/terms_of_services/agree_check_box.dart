import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/register/presentation/manager/controllers/check_box.dart';

/// A widget that represents a checkbox for agreeing to terms of services.
///
/// This widget uses the [AgreeCheckBoxController] to manage its state.
/// When tapped, it toggles the check state and updates the UI accordingly.
class AgreeCheckBox extends StatelessWidget {
  /// Creates an [AgreeCheckBox] widget.
  const AgreeCheckBox({super.key});

  /// Builds the [AgreeCheckBox] widget.
  ///
  /// This method uses the [Get.find] method to find the [AgreeCheckBoxController]
  /// and uses an [Obx] widget to reactively update the UI based on the controller's state.
  ///
  /// @param context The build context.
  /// @returns A widget tree representing the checkbox.
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AgreeCheckBoxController>();

    return Obx(
      () => GestureDetector(
        onTap: () => controller.changeCheckState(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
              width: .5,
              color: primary400,
            ),
            color: controller.isChecked ? primary400 : Colors.transparent,
          ),
          child: controller.isChecked
              ? const Icon(
                  SolarIconsOutline.unread,
                  size: 20,
                  color: primaryWhite,
                ).animate().fadeIn(duration: const Duration(milliseconds: 650))
              : const SizedBox(width: 20, height: 20),
        ),
      ),
    );
  }
}
