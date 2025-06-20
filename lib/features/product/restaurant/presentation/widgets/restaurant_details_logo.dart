import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/restaurant/presentation/manager/restaurant_data.dart';

class RestaurantDetailsLogo extends StatelessWidget {
  const RestaurantDetailsLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = Get.find<RestaurantDataController>();
    final logo = restaurantController.restaurant?.logo;
    return CircleAvatar(
      radius: 35.r,
      backgroundColor: Colors.white,
      child: logo == null
          ? const CircleShimmer(radius: 35)
          : Container(
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 34.r,
                backgroundColor: Colors.white,
                child: OptimizedImageLoader(
                  imageUrl: logo,
                  height: 80,
                  width: 230,
                ),
              ),
            ),
    );
  }
}
