import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealCockTime extends StatelessWidget {
  const MealCockTime({super.key});

  @override
  Widget build(BuildContext context) {
    final mealController = Get.find<MealDetailsController>();
    final time = mealController.mealDetails?.time;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                SolarIconsOutline.clockCircle,
                color: context.textStyle.displaySmall!.color,
                size: 18.sp,
              ),
              addHorizontalSpace(3),
              Text(
                "$time",
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Text(
            'Delivery Time',
            style: context.textStyle.displaySmall!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
            ),
          )
        ],
      ),
    );
  }
}
