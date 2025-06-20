import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_cock_time.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_rating/divider_bar.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_rating/meal_rating_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/widgets/meal_rating/meal_rating_stars.dart';

class MealRatingBar extends StatelessWidget {
  const MealRatingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      height: 50.h,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: context.appTheme.inputDecorationTheme.fillColor,
        border: Border.all(
          color: context.appTheme.inputDecorationTheme.border!.borderSide.color,
        ),
      ),
      child: const ContainerWithShadow(
        radius: 12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MealRatingStars(),
            DividerBar(),
            MealRatingCount(),
            DividerBar(),
            MealCockTime()
          ],
        ),
      ),
    );
  }
}
