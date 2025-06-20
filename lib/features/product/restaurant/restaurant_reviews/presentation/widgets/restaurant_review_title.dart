import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantReviewTitle extends StatelessWidget {
  const RestaurantReviewTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String title = restaurantController.getRestaurantTitleForLanguage();
    return Text(
      title,
      style: context.textStyle.displaySmall!.copyWith(fontSize: 22.sp),
    );
  }
}
