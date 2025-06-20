import 'dart:developer';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:food_zone/config/api.dart';
import 'package:food_zone/features/main/user/basket/data/data_sources/promotions_hook.dart';
import 'package:food_zone/features/main/user/basket/data/models/promotions_response.dart';
import 'package:food_zone/main.dart';
import 'package:http/http.dart' as http;

PromotionsHook? usePromotionsHook() {
  final promotions = useState<List<PromotionsResponse>?>(null);
  final loading = useState<bool>(false);

  Future<void> fetchPromotionsData() async {
    loading.value = true;
    final Uri url = Uri.parse('$baseUrl/promotion/all');
    try {
      final response = await http.get(url, headers: prefs.authHeaders);
      if (response.statusCode == 200) {
        promotions.value = promotionsResponseFromJson(response.body);
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
      }
    } catch (error) {
      log(error.toString());
    } finally {
      loading.value = false;
    }
  }

  useEffect(() {
    fetchPromotionsData();
    return;
  }, []);

  void reFetch() {
    fetchPromotionsData();
  }

  return PromotionsHook(
    promotions: promotions.value,
    loading: loading.value,
    reFetch: reFetch,
  );
}
