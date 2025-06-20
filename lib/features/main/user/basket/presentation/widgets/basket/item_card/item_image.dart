import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';

class ItemImage extends StatelessWidget {
  const ItemImage(this.cover, {super.key});

  final String cover;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthByValue(75),
      height: context.widthByValue(75),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: OptimizedImageLoader(imageUrl: cover, height: 100, width: 400),
    );
  }
}
