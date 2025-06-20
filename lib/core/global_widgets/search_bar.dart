import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/search_response.dart';

import 'package:food_zone/features/main/home/presentation/manager/offers.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        showSearch(
          context: context,
          delegate: CustomSearchDelegate(),
        );
      },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: context.translate.search,
        prefixIcon: const Icon(
          SolarIconsOutline.magnifier,
          color: neutral100,
          size: 22,
        ),
        suffixIcon: Icon(
          SolarIconsOutline.tuning_2,
          size: 24,
          color: context.textStyle.titleLarge!.color,
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  CustomSearchDelegate();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final OffersLogic searchLogic = Get.find();
    searchLogic.search(query);
    return Obx(() {
      final result = searchLogic.searchResult;
      final loading = searchLogic.searchLoading;

      return Center(
        child: loading
            ? const PageLoading()
            : result == null
                ? const Text('data')
                : ResponsiveLayout(
                    portrait: SizedBox(
                      width: context.widthByValue(345),
                      height: context.height,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        children: [
                          addVerticalSpace(10),
                          if (result.categories.isNotEmpty)
                            Column(
                              spacing: context.heightByValue(10),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Categories',
                                  style:
                                      context.textStyle.displaySmall!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                addVerticalSpace(5),
                                ...buildCategoriesFoundList(result, context),
                                addVerticalSpace(10),
                              ],
                            ),
                          if (result.meals.isNotEmpty)
                            Column(
                              spacing: context.heightByValue(10),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Divider(color: neutral100, thickness: .5.h),
                                Text(
                                  'Meals',
                                  style:
                                      context.textStyle.displaySmall!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ...buildMealsFoundList(result, context),
                                Divider(color: neutral100, thickness: .5.h),
                              ],
                            ),
                          if (result.restaurants.isNotEmpty)
                            Column(
                              spacing: context.heightByValue(10),
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Restaurants',
                                  style:
                                      context.textStyle.displaySmall!.copyWith(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                ...List.generate(result.restaurants.length,
                                    (index) {
                                  final restaurant = result.restaurants[index];
                                  return ContainerWithShadow(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.0.w),
                                      child: SizedBox(
                                        width: context.widthByValue(345),
                                        height: context.heightByValue(65),
                                        child: Row(
                                          spacing: context.widthByValue(12),
                                          children: [
                                            Container(
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                              ),
                                              width: context.widthByValue(45),
                                              height: context.widthByValue(45),
                                              child: OptimizedImageLoader(
                                                imageUrl: restaurant.cover,
                                                height: 100,
                                                width: 400,
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  context.isEn
                                                      ? restaurant.title.en
                                                      : restaurant.title.ar,
                                                  style: context
                                                      .textStyle.headlineMedium!
                                                      .copyWith(
                                                          fontSize: 14.sp),
                                                ),
                                                Row(
                                                  spacing:
                                                      context.widthByValue(5),
                                                  children: <Widget>[
                                                    ProductRating(
                                                        rate:
                                                            restaurant.rating),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 20.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
      );
    });
  }

  List<Widget> buildMealsFoundList(
      SearchResponse result, BuildContext context) {
    return List.generate(result.meals.length, (index) {
      final meal = result.meals[index];
      return ContainerWithShadow(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SizedBox(
            width: context.widthByValue(345),
            height: context.heightByValue(65),
            child: Row(
              spacing: context.widthByValue(12),
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  width: context.widthByValue(45),
                  height: context.widthByValue(45),
                  child: OptimizedImageLoader(
                    imageUrl: result.meals[index].images.first.url,
                    height: 100,
                    width: 400,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.isEn ? meal.title.en : meal.title.ar,
                      style: context.textStyle.headlineMedium!
                          .copyWith(fontSize: 14.sp),
                    ),
                    Row(
                      spacing: context.widthByValue(5),
                      children: <Widget>[
                        if (meal.isNewMeal)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: green700,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'New',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: primaryWhite,
                              ),
                            ),
                          ),
                        if (meal.isOffer)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: green700,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              'Offer',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: primaryWhite,
                              ),
                            ),
                          ),
                        ProductRating(rate: meal.rating),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  List<Widget> buildCategoriesFoundList(
      SearchResponse result, BuildContext context) {
    return List.generate(
      result.categories.length,
      (index) => ContainerWithShadow(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: SizedBox(
            width: context.widthByValue(345),
            height: context.heightByValue(59),
            child: Row(
              spacing: context.widthByValue(12),
              children: [
                SizedBox(
                  width: context.widthByValue(30),
                  height: context.widthByValue(30),
                  child: OptimizedImageLoader(
                    imageUrl: result.categories[index].icon,
                    height: 50,
                  ),
                ),
                Text(
                  context.isEn
                      ? result.categories[index].title.en
                      : result.categories[index].title.ar,
                  style: context.textStyle.headlineMedium!
                      .copyWith(fontSize: 14.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search for meals,restaurants.'),
    );
  }
}
