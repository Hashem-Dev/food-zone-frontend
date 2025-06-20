import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_cancellation.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_cancellation/other_reason_field.dart';

class OrderCancellationView extends StatelessWidget {
  const OrderCancellationView({super.key});

  @override
  Widget build(BuildContext context) {
    final cancellationLogic = Get.put(OrderCancellationLogic());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cancel Order',
          style: context.textStyle.displaySmall!.copyWith(fontSize: 22.sp),
        ),
      ),
      body: ResponsiveLayout(
        portrait: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  spacing: context.heightByValue(16),
                  children: [
                    ...buildCancellationReasonList(context, cancellationLogic),
                    const OtherReasonField(),
                    addVerticalSpace(25),
                  ],
                ),
              ),
            ),
            Obx(() {
              final bool pressable = cancellationLogic.groupValue == '';

              return FButton(
                size: true,
                title: 'Submit',
                onPressed: pressable
                    ? null
                    : () async {
                        await cancellationLogic.submitOrderCancellation();
                      },
              );
            }),
          ],
        ),
      ),
    );
  }

  List<Widget> buildCancellationReasonList(
      BuildContext context, OrderCancellationLogic cancellationLogic) {
    return List.generate(OrderCancellationLogic.cancelReasons.length, (index) {
      final reason = OrderCancellationLogic.cancelReasons[index];
      return Container(
        width: context.widthByValue(345),
        height: context.heightByValue(56),
        decoration: BoxDecoration(
          color: context.isDarkMode ? neutral600 : primaryWhite,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1,
            color: context.isDarkMode ? neutral400 : neutral50,
          ),
        ),
        child: Center(
          child: Obx(() {
            final groupValue = cancellationLogic.groupValue;
            return RadioListTile.adaptive(
              toggleable: true,
              useCupertinoCheckmarkStyle: true,
              title: Text(
                reason,
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    context.textStyle.displaySmall!.copyWith(fontSize: 16.sp),
              ),
              value: '$index',
              activeColor: primary500,
              groupValue: groupValue,
              onChanged: (value) {
                cancellationLogic.groupValue = value.toString();
              },
            );
          }),
        ),
      );
    });
  }
}
