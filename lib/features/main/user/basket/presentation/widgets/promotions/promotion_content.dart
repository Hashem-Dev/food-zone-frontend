import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/card/promotion_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/promotions/get_promotions_button.dart';

class PromotionContent extends StatelessWidget {
  const PromotionContent(this.promotions, {super.key});

  final List<PromotionsResponse> promotions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...List.generate(
              promotions.length,
              (index) {
                final promotion = promotions[index];
                return PromotionCard(promotion: promotion, index: index);
              },
            ),
            const GetPromotionsButton(),
          ],
        ),
      ),
    );
  }
}
