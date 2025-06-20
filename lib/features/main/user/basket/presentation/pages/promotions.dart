import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/repositories/fetch_promotions.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/promotions.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/promo_code_search.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/promotion_content.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/promotion_shimmer.dart';

class PromotionsView extends HookWidget {
  const PromotionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final promotionData = usePromotionsHook();
    final promotions = promotionData?.promotions;
    final promotionLogic = Get.put(PromotionsLogic());
    final ItemCardLogic itemCardLogic = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Promotions',
          style: context.textStyle.displaySmall!.copyWith(
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ResponsiveLayout(
        portrait: promotions == null
            ? const PromotionShimmer()
            : Column(
                spacing: context.heightByValue(16),
                children: <Widget>[
                  const PromoCodeSearch(),
                  PromotionContent(promotions),
                  SizedBox(
                    width: context.width,
                    child: Obx(() {
                      final selectedPromotion =
                          promotionLogic.promotionTileValue;
                      return FButton(
                        title: 'Apply',
                        onPressed: selectedPromotion == ''
                            ? null
                            : () {
                                final index = int.parse(selectedPromotion);
                                final promotion = promotions[index];

                                promotionLogic.applyPromotion(promotion.code);
                                final symbol = promotion.discountType == 'fixed'
                                    ? r'$'
                                    : '%';
                                final appliedPromotion = {
                                  "id": promotion.id,
                                  "name": promotion.name,
                                  "discount":
                                      '${promotion.discountValue}$symbol'
                                };
                                itemCardLogic.promotionData = appliedPromotion;
                              },
                      );
                    }),
                  )
                ],
              ),
      ),
    );
  }
}
