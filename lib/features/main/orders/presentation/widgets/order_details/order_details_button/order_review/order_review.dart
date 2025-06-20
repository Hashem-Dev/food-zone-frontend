import 'dart:developer';
import 'dart:io';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/photo_uploader_buttons.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/review_text_field.dart';

class OrderReview extends StatelessWidget {
  const OrderReview({super.key, required this.order});

  final String order;

  @override
  Widget build(BuildContext context) {
    final OrderDetailsLogic detailsLogic = Get.find();
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.horizontalPadding(8),
      ),
      height: context.heightByValue(150),
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
              const ReviewTextField(index: 0),
              const Spacer(),
              PhotoUploaderButtons(order: order, forOrder: true),
              addVerticalSpace(12),
            ],
          ),
          Obx(() {
            final image = detailsLogic.orderReviewImage;
            log(image.toString());
            return image == null
                ? const Text('')
                : Positioned(
                    bottom: context.heightByValue(10),
                    child: Container(
                      width: context.widthByValue(100),
                      height: context.heightByValue(40),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Image.file(
                        File(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
