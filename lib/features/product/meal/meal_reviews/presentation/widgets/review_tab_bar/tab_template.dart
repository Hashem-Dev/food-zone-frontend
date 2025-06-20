import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_reviews/presentation/manager/tab_bar.dart';

class TabTemplate extends StatelessWidget {
  const TabTemplate({
    super.key,
    required this.index,
    required this.text,
    this.withStar = false,
  });

  final int index;
  final String text;
  final bool withStar;

  @override
  Widget build(BuildContext context) {
    final TabBarLogic tabBarLogic = Get.find();
    final Color color =
        context.brightness == Brightness.dark ? neutral500 : neutral50;
    return Obx(() {
      final sameIndex = tabBarLogic.tabIndex == index;
      return AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: context.w * 0.02036),
        height: context.h * 0.04225,
        padding: EdgeInsets.symmetric(horizontal: context.w * 0.03053),
        decoration: BoxDecoration(
          gradient: sameIndex
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [primary500, primary400],
                )
              : LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color, color],
                ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            if (sameIndex)
              Icon(SolarIconsOutline.unread, size: 20.sp, color: primaryWhite),
            if (sameIndex) addHorizontalSpace(10),
            Text(
              text,
              style: context.textStyle.displaySmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: sameIndex ? primaryWhite : null,
              ),
            ),
            if (withStar) addHorizontalSpace(6),
            if (withStar)
              Icon(
                Icons.star_rounded,
                size: 14.sp,
                color: sameIndex ? primaryWhite : neutral100,
              ),
          ],
        ),
      );
    });
  }
}
