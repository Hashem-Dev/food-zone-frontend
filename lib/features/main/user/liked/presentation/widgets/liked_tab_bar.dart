import 'package:food_zone/exports.dart';

class LikedTabBar extends StatelessWidget {
  const LikedTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: primaryWhite,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18.sp,
      ),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: primary500,
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      labelPadding: EdgeInsets.symmetric(vertical: 2.w),
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: const [
        Text('Meals'),
        Text('Restaurants'),
      ],
    );
  }
}
