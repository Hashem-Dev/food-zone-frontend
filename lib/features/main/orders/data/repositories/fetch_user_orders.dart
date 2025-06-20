import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/data_sources/user_orders_hook.dart';
import 'package:food_zone/features/main/orders/data/models/orders.dart';
import 'package:http/http.dart' as http;

UserOrdersHook? useUserOrdersHook({String status = '', int limit = 10}) {
  final orders = useState<List<OrdersResponse>?>(null);
  final loading = useState<bool>(false);

  Future<void> fetchOrdersData() async {
    loading.value = true;
    final Uri url =
    Uri.parse('$baseUrl/order/orders?status=$status&limit=$limit');

    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode != 200) {
        log(response.statusCode.toString());
        log(response.body.toString());
        showErrorSnackBar('Failed to get user orders.');
        return;
      }
      orders.value = ordersResponseFromJson(response.body);
    } catch (error) {
      log(error.toString());
    } finally {
      loading.value = false;
    }
  }

  useEffect(() {
    fetchOrdersData();
    return;
  }, []);

  void reFetch() {
    fetchOrdersData();
  }

  return UserOrdersHook(
    userOrders: orders.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
