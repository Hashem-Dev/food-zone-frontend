import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';
import 'package:intl/intl.dart';

class PromotionDetails extends StatelessWidget {
  const PromotionDetails(this.promotion, {super.key});

  final PromotionsResponse promotion;

  @override
  Widget build(BuildContext context) {
    final symbol = promotion.discountType == 'fixed' ? r'$' : '%';
    final startDate = DateFormat('dd/MM/yyyy').format(promotion.startDate);
    final endDate = DateFormat('dd/MM/yyyy').format(promotion.endDate);
    return ResponsiveLayout(
      portrait: SizedBox(
        width: context.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Promotion Information',
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            addVerticalSpace(24),
            Center(
              child: SvgPicture.asset(
                FAssets.promotion,
                width: context.widthByValue(100),
                height: context.heightByValue(100),
              ),
            ),
            addVerticalSpace(24),
            Center(
              child: Text(
                promotion.name.toUpperCase(),
                style: context.textStyle.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            addVerticalSpace(24),
            const _DetailTitle('Description :'),
            addVerticalSpace(8),
            _DetailSubtitle(promotion.description),
            addVerticalSpace(24),
            const _DetailTitle('Duration :'),
            addVerticalSpace(8),
            _DetailSubtitle('$startDate - $endDate'),
            addVerticalSpace(24),
            const _DetailTitle('Promo Code :'),
            addVerticalSpace(8),
            _DetailSubtitle(promotion.code),
            addVerticalSpace(24),
            const _DetailTitle('Discount Amount :'),
            _DetailSubtitle('${promotion.discountValue}$symbol'),
            addVerticalSpace(24),
            const _DetailTitle('Terms and Conditions :'),
            addVerticalSpace(8),
            ...List.generate(promotion.condition.length, (index) {
              final condition = promotion.condition[index];
              return _DetailSubtitle('- ${condition.conditionTitle}');
            }),
            addVerticalSpace(24),
            const _DetailTitle('Available For :'),
            addVerticalSpace(8),
            Text(
              '${promotion.maxUses} Uses',
              style: TextStyle(
                color: primary500,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailSubtitle extends StatelessWidget {
  const _DetailSubtitle(this.subtitle);

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(
        fontSize: 16.sp,
        color: context.isDarkMode ? neutral300 : neutral400,
      ),
    );
  }
}

class _DetailTitle extends StatelessWidget {
  const _DetailTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textStyle.displaySmall!.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
