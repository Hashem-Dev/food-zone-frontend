import 'package:food_zone/core/global_widgets/search_bar.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/favorite_meals.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/liked_tab_bar.dart';
import 'package:food_zone/features/main/user/liked/presentation/widgets/restaurants/restaurants.dart';

class LikedView extends StatelessWidget {
  const LikedView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: Text(
            'Liked',
            style: context.textStyle.displaySmall!.copyWith(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ResponsiveLayout(
          portrait: prefs.refreshToken.isEmpty
              ? Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'To view your favorite list please login.',
                      style: context.textStyle.displayLarge!.copyWith(
                          fontSize: 18.sp, fontWeight: FontWeight.w500),
                    ),
                    addVerticalSpace(context.heightByValue(24)),
                    const AppRedirect(),
                  ],
                ))
              : SizedBox(
                  height: context.height,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const AppSearchBar(),
                      addVerticalSpace(context.heightByValue(24)),
                      const LikedTabBar(),
                      addVerticalSpace(context.heightByValue(12)),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            FavoriteMeals(),
                            FavoriteRestaurants(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
