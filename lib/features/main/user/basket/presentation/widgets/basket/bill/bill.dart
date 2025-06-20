import 'package:food_zone/exports.dart';

import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/bill/bill_row.dart';

class Bill extends StatelessWidget {
  const Bill({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardLogic = Get.find();
    return FutureBuilder(
        future: Future(() {}),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Text('');
          }
          return Obx(() {
            final price = itemCardLogic.finalPrice;
            final discount = itemCardLogic.discount;
            return SizedBox(
              height: context.heightByValue(135),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  BillRow(title: 'Subtotal', price: price.toStringAsFixed(2)),
                  const BillRow(title: 'Delivery Fee'),
                  BillRow(
                      title: 'Discount', price: discount.toStringAsFixed(2)),
                  Divider(color: neutral50, thickness: 1.h),
                  BillRow(title: 'Total', price: price.toStringAsFixed(2)),
                ],
              ),
            );
          });
        });
  }
}
