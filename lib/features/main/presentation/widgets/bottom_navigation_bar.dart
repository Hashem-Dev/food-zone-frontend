import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/presentation/manager/button_navigation_bar.dart';
import 'package:food_zone/features/main/presentation/widgets/button_navbar.dart';

class ButtonNavigationBar extends StatelessWidget {
  const ButtonNavigationBar({super.key});

  static List<IconData> unSelectedIcons = [
    SolarIconsOutline.home2,
    SolarIconsOutline.clipboard,
    SolarIconsOutline.heart,
    SolarIconsOutline.bell,
    SolarIconsOutline.userCircle,
  ];

  static List<IconData> selectedIcons = [
    SolarIconsBold.home,
    SolarIconsBold.clipboard,
    SolarIconsBold.heart,
    SolarIconsBold.bell,
    SolarIconsBold.userCircle,
  ];

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(ButtonNavigationBarController());

    List<String> labels = [
      context.translate.home,
      context.translate.orders,
      context.translate.liked,
      context.translate.notification,
      context.translate.profile,
    ];

    return Container(
      height: 65.h,
      width: context.w,
      padding: EdgeInsets.symmetric(vertical: 12.h),
      margin: EdgeInsets.symmetric(horizontal: 9.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: context.isDarkMode ? neutral400 : primaryWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x330D0A2C),
            blurRadius: 10,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          5,
          (index) {
            final label = labels[index];
            final selectedIcon = selectedIcons[index];
            final unSelectedIcon = unSelectedIcons[index];
            return GestureDetector(
              onTap: () => navigationController.selectButton(index),
              child: ButtonNavbar(
                index: index,
                label: label,
                selectedIcon: selectedIcon,
                unSelectedIcon: unSelectedIcon,
              ),
            );
          },
        ),
      ),
    );
  }
}
