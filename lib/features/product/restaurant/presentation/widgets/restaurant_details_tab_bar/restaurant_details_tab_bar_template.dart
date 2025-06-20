import 'package:food_zone/core/global_widgets/animated_over_flow_text.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_tab_bar.dart';

class RestaurantDetailsTabBarTemplate extends StatelessWidget {
  const RestaurantDetailsTabBarTemplate({
    super.key,
    required this.index,
    required this.text,
  });

  final int index;
  final String text;

  @override
  Widget build(BuildContext context) {
    final tabController = Get.find<RestaurantTabBarController>();
    final Color color =
    context.brightness == Brightness.dark ? neutral500 : neutral50;

    return Obx(() {
      final sameIndex = tabController.index == index;

      return AnimatedContainer(
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.symmetric(horizontal: context.w * 0.02036),
        height: context.h * 0.04225,
        width: context.w / 2,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (sameIndex)
              Icon(
                SolarIconsOutline.unread,
                size: 20.sp,
                color: primaryWhite,
              ),
            if (sameIndex) addHorizontalSpace(5),
            Expanded(
              child: SizedBox(
                height: context.h * 0.04225,
                child: Center(
                  child: OverFlowAnimatedText(
                    text: text,
                    textStyle: context.textStyle.displaySmall!.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: sameIndex ? primaryWhite : null,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
