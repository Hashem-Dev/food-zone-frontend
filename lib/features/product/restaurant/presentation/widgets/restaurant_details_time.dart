import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsTime extends StatelessWidget {
  const RestaurantDetailsTime({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String? time = restaurantController.restaurant?.time;
    return time == null
        ? const ShimmerContainer(width: 120, height: 22)
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: primary500,
              border: Border.all(
                width: 2,
                color: primary500,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12.sp,
                color: neutral50,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
  }
}
