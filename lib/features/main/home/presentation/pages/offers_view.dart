import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/offers_response.dart';
import 'package:food_zone/features/main/home/data/repositories/fetch_hooks/offers.dart';

import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_offer_image.dart';
import 'package:food_zone/features/main/home/presentation/widgets/meal_offer/meal_offers_price.dart';
import 'package:food_zone/features/main/home/presentation/widgets/product_rating.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/pages/meal_details.dart';

class OffersView extends HookWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    final offersHook = useOffersHook(limit: 10);
    final offers = offersHook?.offers;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Special Offers',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
          ),
        ),
      ),
      body: ResponsiveLayout(
        portrait: offers == null
            ? const Text('data')
            : GridView.builder(
                itemCount: offers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  mainAxisExtent: context.heightByValue(187),
                ),
                itemBuilder: (context, index) {
                  final offer = offers[index];
                  final List<OfferImage> images = offer.images;
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => MealDetails(mealId: offer.id));
                    },
                    child: SizedBox(
                      width: context.widthByValue(160.5),
                      child: ContainerWithShadow(
                        radius: 12,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MealOfferImage(images: images),
                              Text(
                                context.isEn ? offer.title.en : offer.title.ar,
                                style: context.textStyle.displaySmall!.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              ProductRating(rate: offer.rating),
                              MealOffersPrice(
                                price: offer.price,
                                withoutOffer: offer.priceWithoutDiscount,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
