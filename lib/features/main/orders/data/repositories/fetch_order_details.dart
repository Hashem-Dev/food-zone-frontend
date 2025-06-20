import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/data_sources/order_details_hook.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:http/http.dart' as http;

OrderDetailsHook useOrderDetailsHook(String orderId) {
  final details = useState<OrderDetails?>(null);
  final loading = useState<bool>(false);

  Future<void> fetchOrderDetails() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/order/details?id=$orderId');
    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode != 200) {
        showErrorSnackBar('Unexpected Error, try again late.');
        return;
      }
      details.value = orderDetailsFromJson(response.body);
    } catch (error) {
      log(error.toString());
      showErrorSnackBar('Failed to view this order.');
      rethrow;
    } finally {
      loading.value = false;
    }
  }

  useEffect(() {
    fetchOrderDetails();
    return;
  }, []);

  void reFetch() => fetchOrderDetails();

  return OrderDetailsHook(
    orderDetails: details.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
