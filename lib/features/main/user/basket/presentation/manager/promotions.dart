import 'dart:developer';

import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/presentation/manager/item_card.dart';
import 'package:http/http.dart' as http;

class PromotionsLogic extends GetxController {
  final RxString _tileValue = ''.obs;
  final ItemCardLogic itemCardLogic = Get.find();
  final RxBool _loading = false.obs;

  set promotionTileValue(String value) => _tileValue.value = value.toString();

  String get promotionTileValue => _tileValue.value;

  Future<void> applyPromotion(String code) async {
    _loading.value = true;
    final Uri uri = Uri.parse('$baseUrl/promotion/apply-promotion');
    final body = jsonEncode({
      "promoCode": code,
      "orderData": {
        "total": itemCardLogic.finalPrice,
        "itemCount": itemCardLogic.cartItems.length,
        "items": [],
      },
    });
    try {
      final response = await http.post(
        uri,
        headers: prefs.authHeaders,
        body: body,
      );
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        itemCardLogic.updateFinalPrice(data['newTotal']);
        itemCardLogic.discount = data['discount'].toDouble();
        Get.back();
        showSuccessSnackBar(data['message']);
      } else {
        showErrorSnackBar(data['error']);
      }
    } catch (error) {
      log(error.toString());
    } finally {
      _loading.value = false;
    }
  }
}
