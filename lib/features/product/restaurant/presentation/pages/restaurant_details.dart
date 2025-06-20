import 'package:food_zone/core/global_widgets/rate_button.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/pages/product_rating.dart';
import 'package:food_zone/features/product/restaurant/data/repositories/fetch_restaurant.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_tab_bar.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_appbar.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_location/restaurant_location_address.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_location/restaurant_location_title.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_rating/restaurant_details_rating_card.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_tab_bar/restaurant_details_tab_bar.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_details_tab_bar/restaurant_menu.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_location_map/restaurant_map_card.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_recommend.dart';
import 'package:food_zone/features/product/restaurant/presentation/widgets/restaurant_services/restaurant_details_services.dart';

import '../widgets/all_restaurant_reviews_button.dart';

class RestaurantDetails extends HookWidget {
  const RestaurantDetails({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookData = useRestaurantHook(restaurantId);
    final restaurantController = Get.put(RestaurantDataController());
    final tabController = Get.put(RestaurantTabBarController());

    restaurantController.setRestaurantData(hookData.restaurant);

    return (hookData.restaurant == null || hookData.loading)
        ? const Scaffold()
        : AppRefreshIndicator(
            icon: Icons.restaurant_menu_rounded,
            refresh: () async {
              hookData.reFetch();
            },
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: restaurantDetailsAppbar(context),
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                            spacing: context.heightByValue(12),
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addVerticalSpace(12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      spacing: context.heightByValue(8),
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const RestaurantDetailsLocationTitle(),
                                        const RestaurantLocationAddress(),
                                      ],
                                    ),
                                  ),
                                  RateButton(
                                    page: ProductRatingView(
                                      type: 'restaurant',
                                      title: restaurantController
                                          .getRestaurantTitleForLanguage(),
                                      id: restaurantId,
                                    ),
                                  ),
                                ],
                              ),
                              const RestaurantDetailsServices(),
                              const RestaurantDetailsRatingCard(),
                              const AllRestaurantReviewsButton(),
                              const RestaurantMapCard(),
                              addVerticalSpace(5),
                            ]),
                      ),
                      SliverPersistentHeader(
                        delegate: _StickyHeaderDelegate(),
                        pinned: true,
                      ),
                      SliverToBoxAdapter(
                        child: Obx(() {
                          final isSelected = tabController.index;
                          return Column(
                            children: [
                              addVerticalSpace(20),
                              if (isSelected == 0) const RestaurantMenu(),
                              if (isSelected == 1) const RestaurantRecommend(),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

class _StickyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 50.0;

  @override
  double get maxExtent => 50.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: context.background,
      height: maxExtent,
      child: const Center(
        child: RestaurantDetailsTabBar(),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
