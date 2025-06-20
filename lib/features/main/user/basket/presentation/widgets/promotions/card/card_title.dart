import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/details/promotion_details.dart';

class CardTitle extends StatelessWidget {
  const CardTitle(this.promotion, {super.key});

  final PromotionsResponse promotion;

  @override
  Widget build(BuildContext context) {
    final symbol = promotion.discountType == 'fixed' ? r'$' : '%';
    return Text.rich(
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: SizedBox(
              width: context.widthByValue(80),
              child: FittedBox(
                child: Text(
                  '${promotion.discountValue}$symbol OFF',
                  style: context.textStyle.displaySmall!.copyWith(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          WidgetSpan(child: addHorizontalSpace(10)),
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                _buildPromotionSheet(context);
              },
              child: SizedBox(
                width: context.widthByValue(20),
                height: context.widthByValue(20),
                child: CircleAvatar(
                  backgroundColor: neutral100,
                  child: Icon(
                    Icons.question_mark_rounded,
                    size: 14.sp,
                    color: context.isDarkMode ? neutral900 : primaryWhite,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _buildPromotionSheet(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      backgroundColor: context.isDarkMode ? neutral500 : primaryWhite,
      isDismissible: false,
      builder: (context) => PromotionDetails(promotion),
    );
  }
}
