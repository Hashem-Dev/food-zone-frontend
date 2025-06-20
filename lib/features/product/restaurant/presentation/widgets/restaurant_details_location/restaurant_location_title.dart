import 'package:food_zone/exports.dart';

import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsLocationTitle extends StatelessWidget {
  const RestaurantDetailsLocationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String addressTitle = restaurantController.restaurant!.coords.title;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          SolarIconsBold.mapPoint,
          color: neutral100,
          size: 18.sp,
        ),
        addHorizontalSpace(5),
        Text(
          addressTitle,
          style: TextStyle(
            fontSize: 16.sp,
            color: neutral200,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
