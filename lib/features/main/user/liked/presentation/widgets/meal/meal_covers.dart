import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';

class MealCovers extends StatelessWidget {
  const MealCovers({super.key, required this.images});

  final List images;

  @override
  Widget build(BuildContext context) {
    images.shuffle();
    return Container(
      width: context.width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: OptimizedImageLoader(
        imageUrl: images.first.publicId,
        height: 350,
        width: 500,
      ),
    );
  }
}
