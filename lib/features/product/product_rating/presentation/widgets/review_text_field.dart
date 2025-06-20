import 'package:food_zone/exports.dart';
import 'package:food_zone/features/product/product_rating/presentation/manager/rating_bar.dart';

class ReviewTextField extends StatelessWidget {
  const ReviewTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.find<RatingBarController>();
    return TextField(
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      textAlignVertical: TextAlignVertical.top,
      controller: ratingController.reviewTextController,
      decoration: InputDecoration(
        fillColor: Colors.transparent,
        hintText: 'Type your review',
        contentPadding: EdgeInsets.only(top: 8.h),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
      ),
      maxLines: null,
      expands: true,
    );
  }
}
