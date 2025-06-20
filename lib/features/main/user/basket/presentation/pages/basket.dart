import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/basket_app_bar/basket_app_bar.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/bill/bill.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/delivery_instruction.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/items_list.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/order_location.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/place_order/order_promotion.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/place_order/place_order_card.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key});

  @override
  Widget build(BuildContext context) {
    final cardLogic = Get.put(ItemCardLogic());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: basketViewAppBar(context),
      body: ResponsiveLayout(
        portrait: Obx(() {
          return Stack(
            children: <Widget>[
              cardLogic.cartItems.isEmpty
                  ? const Center(
                      child: Text('Cart is Empty'),
                    )
                  : Stack(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            spacing: context.heightByValue(10),
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const SizedBox.shrink(),
                              const ItemsList(),
                              const OrderLocation(),
                              const OrderPromotion(),
                              const DeliveryInstruction(),
                              const Bill(),
                              addVerticalSpace(context.heightByValue(170)),
                            ],
                          ),
                        ),
                        const Align(
                          alignment: Alignment.bottomCenter,
                          child: PlaceOrderCard(),
                        ),
                      ],
                    ),
              if (cardLogic.paymentLoading) const PageLoading()
            ],
          );
        }),
      ),
    );
  }
}
