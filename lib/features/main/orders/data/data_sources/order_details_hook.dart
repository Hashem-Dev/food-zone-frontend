import 'dart:ui';

import 'package:food_zone/features/main/orders/data/models/order_details.dart';

class OrderDetailsHook {
  final OrderDetails? orderDetails;
  final bool loading;
  final VoidCallback reFetch;

  OrderDetailsHook({
    required this.orderDetails,
    required this.loading,
    required this.reFetch,
  });
}
