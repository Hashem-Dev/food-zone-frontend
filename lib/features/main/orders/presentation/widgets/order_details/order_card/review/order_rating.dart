import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class OrderItemRating extends StatelessWidget {
  const OrderItemRating({super.key, required this.order});

  final String order;

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic detailsLogic = Get.find();
    return RatingBar.builder(
      itemSize: 22.sp,
      allowHalfRating: true,
      unratedColor: neutral50,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
      itemBuilder: (context, index) {
        return Icon(
          Icons.star_rounded,
          size: 22.sp,
          color: secondary500,
        );
      },
      onRatingUpdate: (double value) {
        detailsLogic.addItemReview(order, value, null);
      },
    );
  }
}
