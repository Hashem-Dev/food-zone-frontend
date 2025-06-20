import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/item_additives.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/item_more_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/item_restaurant.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/order_item_popup_menu.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/order_item_title.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/reorder_button.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/review/order_review.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_image.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/item_price.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard(this.item, {super.key, required this.index});

  final Item item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final image = item.meal.images..shuffle();
    final OrderDetailsLogic orderDetailsLogic = Get.find();
    return Container(
      width: context.width,
      margin: EdgeInsets.symmetric(vertical: context.verticalMargin(5)),
      child: ContainerWithShadow(
        radius: 12,
        darkColor: neutral600,
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.verticalPadding(8),
            horizontal: context.horizontalPadding(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ItemImage(image.first.url),
                  addHorizontalSpace(context.widthByValue(12)),
                  Expanded(
                    child: SizedBox(
                      height: context.heightByValue(77),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          OrderItemTitle(title: item.meal.title),
                          ItemPrice(price: item.price),
                          ItemRestaurant(
                            logo: item.meal.restaurant.logo,
                            title: context.isEn
                                ? item.meal.restaurant.title.en
                                : item.meal.restaurant.title.ar,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: OrderItemPopupMenu(
                      meal: item.meal.id,
                      restaurant: item.meal.restaurant.id,
                    ),
                  ),
                ],
              ),
              addVerticalSpace(12),
              Obx(() {
                final show = orderDetailsLogic.orderStatus == 'delivered' ||
                    orderDetailsLogic.orderStatus == 'canceled';
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ItemMoreDetails(
                      quantity: item.quantity,
                      category: context.isEn
                          ? item.meal.category.title.en
                          : item.meal.category.title.ar,
                    ),
                    if (show) ItemReorderButton(item: item),
                  ],
                );
              }),
              addVerticalSpace(8),
              if (item.additives.isNotEmpty)
                ItemAdditives(additives: item.additives),
              Obx(() {
                if (orderDetailsLogic.orderStatus == 'delivered') {
                  return OrderItemReview(order: item.id, index: index);
                } else {
                  return const SizedBox.shrink();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
