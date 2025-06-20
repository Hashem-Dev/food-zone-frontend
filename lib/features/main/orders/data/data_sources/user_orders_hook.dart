import 'dart:ui';

import 'package:food_zone/features/main/orders/data/models/orders.dart';

class UserOrdersHook {
  final List<OrdersResponse>? userOrders;
  final bool loading;
  final VoidCallback reFetch;

  UserOrdersHook({
    required this.userOrders,
    required this.loading,
    required this.reFetch,
  });
}
