import 'dart:developer';
import 'dart:io';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/order_rating.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/photo_uploader_buttons.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/review_text_field.dart';

class OrderItemReview extends StatelessWidget {
  const OrderItemReview({super.key, required this.order, required this.index});

  final String order;
  final int index;

  @override
  Widget build(BuildContext context) {
    log('message');
    final OrderDetailsLogic detailsLogic = Get.find();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderItemRating(order: order),
        addVerticalSpace(12),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding(8),
          ),
          height: context.heightByValue(100),
          width: context.widthByValue(345),
          decoration: BoxDecoration(
            color: context.isDarkMode
                ? primaryWhite.withValues(alpha: .1)
                : const Color(0xff1F2A37).withValues(alpha: .05),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  ReviewTextField(index: index),
                  const Spacer(),
                  PhotoUploaderButtons(order: order),
                  addVerticalSpace(12),
                ],
              ),
              Obx(() {
                if (detailsLogic.userReviews.isNotEmpty) {
                  final reviews = detailsLogic.userReviews
                      .where((test) => test.id == order);
                  log(reviews.toString());
                  return Positioned(
                    bottom: 5,
                    width: 100,
                    height: 40,
                    child: reviews.isEmpty
                        ? const Text('')
                        : Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Image.file(
                              fit: BoxFit.cover,
                              File(reviews.first.image!),
                            ),
                          ),
                  );
                }
                return const SizedBox.shrink();
              })
            ],
          ),
        )
      ],
    );
  }
}
