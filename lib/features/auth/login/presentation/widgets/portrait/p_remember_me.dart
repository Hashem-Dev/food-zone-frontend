import 'package:food_zone/exports.dart';
import 'package:food_zone/features/auth/login/presentation/manager/controllers/remember_me.dart';

/// A widget that represents a "Remember Me" checkbox with an icon.
///
/// This widget uses the `RememberMeController` to manage the state of the checkbox.
/// When the checkbox is tapped, it toggles the `rememberMe` state in the controller.
class RememberMe extends StatelessWidget {
  /// Creates a new instance of the [RememberMe] widget.
  const RememberMe({super.key});

  /// Builds the widget tree for the [RememberMe] widget.
  ///
  /// @param context The build context for the widget.
  /// @returns A [Widget] tree representing the "Remember Me" checkbox.
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RememberMeController());
    final width = context.w;
    final isLandscape = width > 600;
    return GestureDetector(
      onTap: () => controller.changeRememberMeState(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isLandscape ? 10.w : 24.w,
                height: isLandscape ? 10.w : 24.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: .5,
                    color: controller.rememberMe ? primary500 : neutral100,
                  ),
                  borderRadius: BorderRadius.circular(5.r),
                  color: controller.rememberMe ? primary500 : null,
                ),
                child: controller.rememberMe
                    ? Icon(
                        SolarIconsOutline.unread,
                        size: isLandscape ? 18 : 24,
                        color: primaryWhite,
                      )
                        .animate()
                        .fadeIn(duration: const Duration(milliseconds: 450))
                    : null,
              ),
            ),
            addHorizontalSpace(isLandscape ? 6 : 12),
            Text(
              context.translate.remember_me,
              style: context.textStyle.headlineSmall!
                  .copyWith(fontSize: isLandscape ? 8.sp : null),
            ),
          ],
        ),
      ),
    );
  }
}
