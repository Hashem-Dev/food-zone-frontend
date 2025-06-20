import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';

class RestaurantLogo extends StatelessWidget {
  const RestaurantLogo({
    super.key,
    required this.logo,
    this.width = 26,
  });

  final String logo;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(width),
      height: context.widthByValue(width),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryWhite),
        shape: BoxShape.circle,
        color: primaryWhite,
      ),
      child: OptimizedImageLoader(imageUrl: logo, height: 30, width: 110),
    );
  }
}
