import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_card/order_card.dart';
import 'package:food_zone/features/main/orders/presentation/widgets/order_details/order_detail_promotion.dart';

List<Widget> buildListPromotion(List<Promotion> promotions) {
  return List.generate(promotions.length, (index) {
    final Promotion promotion = promotions[index];
    return OrderDetailPromotion(
      name: promotion.name,
      value: '${promotion.discountValue}',
      discountType: promotion.discountType,
    );
  });
}

List<Widget> buildOrderItem(List<Item> items) {
  return List.generate(items.length, (index) {
    final Item item = items[index];
    return OrderItemCard(item, index: index);
  });
}
