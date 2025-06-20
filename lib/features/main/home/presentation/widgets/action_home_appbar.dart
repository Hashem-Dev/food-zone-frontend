import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/pages/basket.dart';

class ActionHomeAppbar extends StatelessWidget {
  const ActionHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (prefs.refreshToken.isEmpty) {
          redirectDialog(context);
          return;
        }
        Get.to(() => const BasketView());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        width: 42.w,
        height: 42.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? primaryWhite.withValues(alpha: .1)
                : primaryWhite,
            boxShadow: [
              BoxShadow(
                color: const Color(0xff0D0A2C).withValues(alpha: .08),
                blurRadius: 12,
                offset: const Offset(0, 4),
                spreadRadius: 0,
              )
            ]),
        child: const Icon(
          SolarIconsOutline.bag5,
          size: 26,
        ),
      ),
    );
  }
}
