import 'dart:developer';

import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/main/user/basket/presentation/widgets/basket/item_card/basket_item_card.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';
import 'package:http/http.dart' as http;

class ItemCardLogic extends GetxController {
  final language = prefs.userLanguage;
  final RxList<BasketMeal> cartItems = prefs.userBasketItems.obs;
  final RxDouble _finalPrice = (0.0).obs;
  GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();
  TextEditingController deliveryInstruction = TextEditingController();
  final RxBool _paymentLoading = false.obs;
  final RxString _orderId = ''.obs;

  bool get paymentLoading => _paymentLoading.value;
  final Rxn<Map<String, dynamic>> _promotionData = Rxn(null);

  Map<String, dynamic>? get promotionData => _promotionData.value;

  set promotionData(Map<String, dynamic>? promotion) =>
      _promotionData.value = promotion;

  final RxDouble _discount = 0.0.obs;

  double get discount => _discount.value;

  set discount(double price) => _discount.value = price;

  void increaseMealCount(String mealId) async {
    final existingItem = cartItems.firstWhereOrNull((element) {
      return element.mealId == mealId;
    });
    if (existingItem != null) {
      final index = cartItems.indexOf(existingItem);
      existingItem.mealCount++;
      cartItems[index] = existingItem;
      await prefs.saveUserBasketItem(cartItems);
      await prefs.saveMealCount(
        mealId: mealId,
        count: existingItem.mealCount,
      );
      cartItems.refresh();
    }
  }

  void decreaseMealCount(String mealId) async {
    final existingItem = cartItems.firstWhereOrNull((element) {
      return element.mealId == mealId;
    });
    if (existingItem != null) {
      if (existingItem.mealCount > 1) {
        final index = cartItems.indexOf(existingItem);
        existingItem.mealCount--;
        cartItems[index] = existingItem;
        await prefs.saveUserBasketItem(cartItems);
        await prefs.saveMealCount(
          mealId: mealId,
          count: existingItem.mealCount,
        );
        cartItems.refresh();
      }
    }
  }

  void deleteMealFromBasket(String mealId) async {
    final existingItem = cartItems.firstWhereOrNull((element) {
      return element.mealId == mealId;
    });

    if (existingItem != null) {
      animatedListKey.currentState!.removeItem(
        cartItems.indexOf(existingItem),
        duration: const Duration(milliseconds: 800),
        (BuildContext context, Animation<double> animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: BasketItemCard(meal: existingItem),
          ).animate().shimmer(color: neutral500);
        },
      );
      await prefs.removeSavedMealAdditives(existingItem.mealId);
      await prefs.removeSavedMealCount(existingItem.mealId);
    }
    cartItems.remove(existingItem);
    cartItems.refresh();
    await prefs.saveUserBasketItem(cartItems);
  }

  void updateFinalPrice(double price) => _finalPrice.value = price;

  String getTitleForLanguage(Additive additive) {
    if (language == 'ar') {
      return additive.title.ar;
    } else {
      return additive.title.en;
    }
  }

  void getTotalPrice() {
    _finalPrice.value = 0;
    for (final data in cartItems) {
      double mealAdditivesPrice = 0.0;
      for (int i = 0; i < data.selectedAdditives.length; i++) {
        mealAdditivesPrice += data.selectedAdditives[i].additives.price;
      }
      _finalPrice.value += ((data.price + mealAdditivesPrice) * data.mealCount);
    }
    _finalPrice.value -= discount;
    update();
  }

  double get finalPrice => _finalPrice.value;

  final RxList<Map> _items = <Map>[].obs;

  Future<void> addNewOrder(Function successPaymentSheet) async {
    _paymentLoading.value = true;

    try {
      _items.value = cartItems.map((item) {
        return {
          'meal': item.mealId,
          'price': item.price,
          'quantity': item.mealCount,
          'additives': item.selectedAdditives
              .map((additive) => additive.additiveId)
              .toList(),
        };
      }).toList();
      final orderBody = jsonEncode({
        "items": _items,
        "totalPrice": _finalPrice.value,
        'shippingAddress': preferencesController.deliveryLocation['id'],
        'shippingCost': 9.99,
        'discount': discount,
        'deliveryInstruction': deliveryInstruction.text.isEmpty
            ? 'No delivery instruction add.'
            : deliveryInstruction.text,
        'promotions': promotionData == null ? [] : [promotionData?['id']]
      });
      final Uri orderUrl = Uri.parse('$baseUrl/order/new');
      final orderResponse = await http.post(
        orderUrl,
        headers: prefs.authHeaders,
        body: orderBody,
      );

      if (orderResponse.statusCode != 201) {
        Get.snackbar(
          'Payment Error',
          'Error: Payment Failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
      final orderId = jsonDecode(orderResponse.body);
      _orderId.value = orderId;
      showSuccessSnackBar('Order Placed successfully!');
      for (var item in prefs.userBasketItems) {
        await prefs.removeSavedMealCount(item.mealId);
        await prefs.removeSavedMealAdditives(item.mealId);
      }
      await prefs.clearBasketItem();
      cartItems.clear();
      successPaymentSheet();
    } catch (error) {
      Get.snackbar(
        'Connection Error',
        'Failed to initialize payment',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
      );
      log('Network error: ${error.toString()}');
    } finally {
      _paymentLoading.value = false;
    }
  }

  Future<void> checkout() async {
    _paymentLoading.value = true;
    try {
      final Uri checkoutUrl = Uri.parse('$baseUrl/payment/checkout');
      final checkoutResponse = await http.post(checkoutUrl,
          headers: prefs.authHeaders,
          body: jsonEncode({
            'amount': (finalPrice * 100).toStringAsFixed(0),
            'orderId': _orderId.value
          }));
      if (checkoutResponse.statusCode != 200) {
        log('Checkout failed: ${checkoutResponse.statusCode}');
        log('Response body: ${checkoutResponse.body}');
        Get.snackbar(
          'Error',
          'Payment initialization failed',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primary700,
        );
        return;
      }

      final checkoutData = jsonDecode(checkoutResponse.body);
      _paymentLoading.value = false;
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          customFlow: false,
          merchantDisplayName: 'Food Zone Store',
          paymentIntentClientSecret: checkoutData['paymentIntent'],
          customerEphemeralKeySecret: checkoutData['ephemeralKey'],
          customerId: checkoutData['customer'],
        ),
      );

      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (stripeError) {
      if (stripeError.error.code == FailureCode.Canceled) {
        Get.snackbar(
          'Payment Canceled',
          'Your order has been canceled',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: primary300,
        );
      } else {
        Get.snackbar(
          'Payment Error',
          'Error: ${stripeError.error.message}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
        );
      }
    } finally {
      _paymentLoading.value = false;
    }
  }

  @override
  void onInit() {
    deliveryInstruction;
    super.onInit();
  }
}
