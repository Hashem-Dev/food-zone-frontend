import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/presentation/widgets/user_navigation_button.dart';

import '../manager/button_navigation_bar.dart';

class ButtonNavbar extends StatelessWidget {
  const ButtonNavbar({
    super.key,
    required this.label,
    required this.selectedIcon,
    required this.unSelectedIcon,
    required this.index,
  });

  final String label;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(ButtonNavigationBarController());
    final bool isLandscape = context.w > 600;
    return index == 4
        ? const UserNavigationButton()
        : Obx(
            () => SizedBox(
              width: 70.w,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  if (navigationController.selected == index)
                    AnimatedAlign(
                      alignment: Alignment.bottomCenter,
                      duration: const Duration(milliseconds: 250),
                      child: FittedBox(
                        child: Text(
                          label,
                          style: TextStyle(
                            fontSize: isLandscape ? 7.sp : 12.sp,
                            color: primary500,
                            fontWeight: FontWeight.w700,
                          ),
                        ).animate().fadeIn(delay: 250.ms),
                      ),
                    ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 250),
                    bottom: navigationController.selected == index ? 25 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      width: 50.h,
                      height: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: navigationController.selected == index
                            ? primary500
                            : null,
                      ),
                      child: navigationController.selected == index
                          ? Icon(selectedIcon, color: primaryWhite)
                          : Icon(unSelectedIcon, color: neutral100),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
