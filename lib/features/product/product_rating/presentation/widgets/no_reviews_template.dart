import 'package:food_zone/core/global_widgets/rate_button.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/pages/product_rating.dart';

class NoReviewsTemplate extends StatelessWidget {
  const NoReviewsTemplate({
    super.key,
    required this.type,
    required this.id,
    this.title,
  });

  final String type;
  final String id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: context.width,
          child: Text(
            'No reviews for this at now, be the first!',
            textAlign: TextAlign.center,
            style: context.textStyle.displayMedium!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        addVerticalSpace(20),
        RateButton(
          page: ProductRatingView(
            type: type,
            title: title ?? '',
            id: id,
          ),
        )
      ],
    );
  }
}
