import 'package:food_zone/core/global_widgets/optimized_image_loader.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/offers.dart';
import 'package:food_zone/features/main/home/presentation/manager/offers.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';

class OffersImages extends HookWidget {
  const OffersImages({super.key});

  @override
  Widget build(BuildContext context) {
    final offers = Get.put(OffersLogic());
    final offersHook = useOffersHook(limit: 4);
    final offersData = offersHook?.offers;
    return SizedBox(
      height: context.heightByValue(144),
      child: offersData == null
          ? const Text('data')
          : CarouselView(
              itemExtent: 300,
              itemSnapping: true,
              controller: offers.carouselController,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              onTap: (index) =>
                  Get.to(() => MealDetails(mealId: offersData[index].id)),
              children: <Widget>[
                ...List.generate(offersData.length, (index) {
                  final offer = offersData[index];
                  return GestureDetector(
                    child: GridTile(
                      footer: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 8.h,
                        ),
                        height: context.heightByValue(40),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              neutral900.withValues(alpha: .4),
                              neutral900.withValues(alpha: .1),
                              neutral100.withValues(alpha: .01),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          context.isEn ? offer.title.en : offer.title.ar,
                          style: TextStyle(
                            color: primaryWhite,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      child: OptimizedImageLoader(
                        imageUrl: offer.images[1].url,
                        height: 204,
                        width: 800,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                })
              ],
            ),
    );
  }
}
