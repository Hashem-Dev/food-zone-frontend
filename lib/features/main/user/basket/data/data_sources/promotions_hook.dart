import 'dart:ui';

import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';

class PromotionsHook {
  final List<PromotionsResponse>? promotions;
  final bool loading;
  final VoidCallback reFetch;

  PromotionsHook({
    required this.promotions,
    required this.loading,
    required this.reFetch,
  });
}
