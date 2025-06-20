import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class MealImages extends StatelessWidget {
  const MealImages({super.key});

  @override
  Widget build(BuildContext context) {
    final MealDetailsController imageController = Get.find();
    final images = imageController.mealDetails?.images?..shuffle();
    return Container(
      clipBehavior: Clip.hardEdge,
      width: context.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: images == null
          ? const Text('Images null')
          : PageView.builder(
              controller: imageController.imagesController,
              onPageChanged: (page) => imageController.changeIndex(page),
              itemCount: images.length,
              itemBuilder: (BuildContext context, index) {
                final imageUrl = images[index].url;

                return OptimizedImageLoader(imageUrl: imageUrl, height: 300)
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .then()
                    .shimmer(
                      color: primaryWhite.withValues(alpha: .61),
                      curve: Curves.decelerate,
                      size: .2,
                      angle: 7,
                      delay: 1000.ms,
                      duration: 1800.ms,
                    );
              }),
    );
  }
}
