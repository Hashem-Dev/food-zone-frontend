import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';
import 'package:food_zone/features/product/restaurant/restaurant_reviews/presentation/pages/restaurant_reviews_view.dart';

class AllRestaurantReviewsButton extends StatelessWidget {
  const AllRestaurantReviewsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final restaurantId = restaurantController.restaurant!.id;
    return GestureDetector(
      onTap: () {
        Get.to(() {
          return RestaurantReviewsView(restaurantId: restaurantId);
        });
      },
      child: Text(
        'See all Reviews',
        style: TextStyle(
          color: neutral300,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          decorationStyle: TextDecorationStyle.wavy,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
