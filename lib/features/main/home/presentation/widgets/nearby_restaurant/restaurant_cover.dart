import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';

class RestaurantCover extends StatelessWidget {
  const RestaurantCover({
    super.key,
    required this.image,
    this.height = 100,
    this.width,
  });

  final String image;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width ?? context.w,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child:
          OptimizedImageLoader(imageUrl: image, height: height, width: width),
    );
  }
}
