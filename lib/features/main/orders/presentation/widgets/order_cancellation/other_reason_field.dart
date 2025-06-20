import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_cancellation.dart';

class OtherReasonField extends StatelessWidget {
  const OtherReasonField({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderCancellationLogic cancellationLogic = Get.find();
    const List<String> cancelReasons = OrderCancellationLogic.cancelReasons;

    return Obx(() {
      final groupValue = cancellationLogic.groupValue;
      final bool showTextReview = groupValue ==
          cancelReasons.lastIndexOf(cancelReasons.last).toString();
      if (showTextReview) {
        return SizedBox(
          width: context.widthByValue(345),
          height: context.heightByValue(90),
          child: TextField(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            maxLines: null,
            expands: true,
            controller: cancellationLogic.otherReasonController,
            decoration: InputDecoration(
              hintText: 'Other reason ...',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    });
  }
}
