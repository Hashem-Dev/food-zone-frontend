import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';

class MealCover extends StatelessWidget {
  const MealCover({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(180),
      height: context.widthByValue(100),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: OptimizedImageLoader(imageUrl: image, height: 120, width: 445),
    );
  }
}
