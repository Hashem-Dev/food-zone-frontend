import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantLocationAddress extends StatelessWidget {
  const RestaurantLocationAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String addressTitle = restaurantController.restaurant!.coords.address;
    return Text(
      addressTitle,
      style: context.textStyle.displaySmall!.copyWith(fontSize: 14.sp),
    );
  }
}
