import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsCover extends StatelessWidget {
  const RestaurantDetailsCover({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final String? cover = restaurantController.restaurant?.cover;
    return cover == null
        ? ShimmerContainer(width: context.w, height: 280)
        : OptimizedImageLoader(imageUrl: cover, height: 280);
  }
}
