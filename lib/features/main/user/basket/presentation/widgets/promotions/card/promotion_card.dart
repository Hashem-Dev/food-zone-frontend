import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/promotions.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/card/card_subtitle.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/card/card_title.dart';

class PromotionCard extends StatelessWidget {
  const PromotionCard({
    super.key,
    required this.promotion,
    required this.index,
  });

  final PromotionsResponse promotion;
  final int index;

  @override
  Widget build(BuildContext context) {
    final PromotionsLogic promotionsLogic = Get.find();
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsetsDirectional.fromSTEB(4.w, 0, 0, 0),
      decoration: BoxDecoration(
        color: context.isDarkMode ? neutral600 : primaryWhite,
        border: Border.all(
          width: 1,
          color: context.isDarkMode ? neutral400 : neutral50,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
      height: context.heightByValue(66),
      child: Center(
        child: Obx(() {
          return RadioListTile(
            activeColor: primary500,
            visualDensity: VisualDensity.comfortable,
            contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
            controlAffinity: ListTileControlAffinity.trailing,
            title: CardTitle(promotion),
            subtitle: CardSubtitle(promotion.name),
            secondary: SvgPicture.asset(
              FAssets.promotion,
              width: context.widthByValue(35),
            ),
            value: '$index',
            groupValue: promotionsLogic.promotionTileValue,
            onChanged: (index) {
              promotionsLogic.promotionTileValue = index.toString();
            },
          );
        }),
      ),
    );
  }
}
