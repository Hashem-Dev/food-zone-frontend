import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealTags extends StatelessWidget {
  const MealTags({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController mealController =
        Get.find<MealDetailsController>();
    final foodTags = mealController.foodTagsForLanguage();

    return SizedBox(
      height: 15.h,
      width: context.w,
      child: foodTags == null
          ? ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, index) {
                return Container(
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5.w, 0),
                  child: const ShimmerContainer(width: 50, height: 5),
                );
              },
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemCount: foodTags.length,
              itemBuilder: (BuildContext context, index) {
                final String tag = foodTags[index].capitalizeFirst!;
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  margin: EdgeInsetsDirectional.fromSTEB(0, 0, 5.w, 0),
                  decoration: BoxDecoration(
                    color: primary500,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: primaryWhite,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
