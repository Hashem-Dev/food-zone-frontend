import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';

class OrderTotalPrice extends StatelessWidget {
  const OrderTotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    final ItemCardLogic itemCardController = Get.find();

    return FutureBuilder(future: Future(() {
      itemCardController.getTotalPrice();
    }), builder: (context, snap) {
      if (snap.connectionState == ConnectionState.waiting) {
        return const Text("");
      }

      return Obx(() {
        return Text(
          '\$ ${(itemCardController.finalPrice).toStringAsFixed(2)}',
          textAlign: TextAlign.center,
          style: context.textStyle.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
          ),
        );
      });
    });
  }
}
