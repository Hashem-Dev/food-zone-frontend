import 'package:food_zone/core/global_widgets/rate_button.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/data/repositories/fetch_meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_description.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/additives/additives.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/all_reviews_button.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_appbar/meal_appbar.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_description.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_details_shimmer.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_rating/meal_rating_bar.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_tags.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_title.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/order_buttons_card/buttons_card.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/price_text.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/see_more_button.dart';
import 'package:food_zone/features/product/product_rating/presentation/pages/product_rating.dart';

class MealDetails extends HookWidget {
  const MealDetails({super.key, required this.mealId});

  final String mealId;

  @override
  Widget build(BuildContext context) {
    final mealController = Get.put(MealDetailsController());
    Get.put(MealCountController());
    Get.put(MealDescriptionController());
    final data = useMealDetailsHook(mealId);

    return FutureBuilder<void>(
      future: Future(() {
        mealController.setMealDetails(data?.mealDetails);
        mealController.getSavedAdditives();
        mealController.getSavedMealCount();
      }),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MealDetailsShimmer();
        }

        return Obx(() {
          final mealDetail = mealController.mealDetails;

          return mealDetail == null
              ? const MealDetailsShimmer()
              : AppRefreshIndicator(
                  icon: Icons.restaurant_menu_rounded,
                  refresh: () async {
                    data.reFetch();
                  },
                  child: Scaffold(
                    appBar: mealDetailsAppBar(context),
                    body: Stack(
                      children: [
                        SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addVerticalSpace(20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const MealTitle(),
                                      addVerticalSpace(9),
                                      const MealPriceText(),
                                    ],
                                  ),
                                  RateButton(
                                    page: ProductRatingView(
                                      type: 'meal',
                                      title: mealController
                                              .getMealTitleForLanguage() ??
                                          '',
                                      id: mealId,
                                    ),
                                  ),
                                ],
                              ),
                              addVerticalSpace(16),
                              const MealRatingBar(),
                              addVerticalSpace(8),
                              const AllMealReviewsButton(),
                              addVerticalSpace(16),
                              const MealTags(),
                              addVerticalSpace(12),
                              const MealDescription(),
                              addVerticalSpace(12),
                              const SeeMoreButton(),
                              addVerticalSpace(12),
                              Text(
                                'Additional Options :',
                                style: context.textStyle.displaySmall!
                                    .copyWith(fontSize: 16.sp),
                              ),
                              MealAdditives(
                                additive: data!.mealDetails!.additives,
                              ),
                              addVerticalSpace(100),
                            ],
                          ),
                        ),
                        const ButtonsCard(),
                      ],
                    ),
                  ),
                );
        });
      },
    );
  }
}
