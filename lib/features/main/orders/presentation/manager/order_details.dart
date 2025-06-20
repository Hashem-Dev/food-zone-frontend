import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/data/models/order_details.dart';
import 'package:food_zone/features/main/orders/data/models/order_user_review.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class OrderDetailsLogic extends GetxController {
  final RxList<OrderUserReview> userReviews = <OrderUserReview>[].obs;
  final Rxn<XFile?> _uploadedImage = Rxn<XFile?>(null);
  final ImagePicker _picker = ImagePicker();
  final Rx<XFile?> _orderReviewImage = Rxn<XFile?>(null);
  final RxList<TextEditingController> _reviewsTextController =
      <TextEditingController>[].obs;
  final RxString _orderStatus = ''.obs;
  final _reorderLoading = false.obs;
  final Rxn<OrderDetails> _orderDetails = Rxn<OrderDetails>(null);
  final RxString _orderAddress = ''.obs;
  final RxString _deliveryInstruction = ''.obs;

  bool get reorderLoading => _reorderLoading.value;

  String get orderStatus => _orderStatus.value;

  List<TextEditingController> get reviewTextControllers {
    return _reviewsTextController;
  }

  String? get orderReviewImage => _orderReviewImage.value?.path;

  set reorderLoading(bool state) => _reorderLoading.value = state;

  set orderStatus(String status) => _orderStatus.value = status;

  set reviewTextControllers(List<TextEditingController> controllers) {
    _reviewsTextController.value = controllers;
  }

  set orderAddress(String address) => _orderAddress.value = address;

  set deliveryInstruction(String instruction) {
    _deliveryInstruction.value = instruction;
  }

  set orderDetails(OrderDetails? order) => _orderDetails.value = order;

  void addItemReview(String itemId, double? rating, String? img) {
    final OrderUserReview userReview = OrderUserReview(
      id: itemId,
      rating: rating,
      image: img,
    );
    if (userReviews.contains(userReview)) {
      final reviewIndex = userReviews.indexOf(userReview);
      final existReview = userReviews[reviewIndex];
      log(existReview.id);
      if (img != null) {
        existReview.image = img;
      }
      if (rating != null) {
        existReview.rating = rating;
      }
      userReviews.remove(existReview);
      userReviews.add(existReview);
      log(existReview.image.toString());
      return;
    }
    userReviews.add(userReview);
  }

  Future<void> uploadFromCamera(String id) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _uploadedImage.value = pickedImage;
      addItemReview(id, null, _uploadedImage.value!.path);
    }
  }

  Future<void> uploadOrderReviewFromCamera() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _orderReviewImage.value = pickedImage;
    }
  }

  Future<void> uploadOrderReviewFromGallery() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _orderReviewImage.value = pickedImage;
    }
  }

  Future<void> uploadFromGallery(String id) async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _uploadedImage.value = pickedImage;
      addItemReview(id, null, _uploadedImage.value!.path);
    }
  }

  Future<void> reorderMeal(Item item) async {
    _reorderLoading.value = true;
    late double additivesPrice = 0.0;
    for (final additive in item.additives) {
      additivesPrice += additive.price;
    }
    final totalPrice = (item.price + additivesPrice) * item.quantity;

    final body = {
      'items': [
        {
          'meal': item.meal.id,
          'price': item.price,
          'quantity': item.quantity,
          'additives': item.additives.map((additive) => additive.id).toList(),
        },
      ],
      'totalPrice': totalPrice,
      "shippingAddress": _orderAddress.value,
      "deliveryInstruction": _deliveryInstruction.value,
      "shippingCost": 9.99,
      "promotions": [],
    };

    try {
      final Uri url = Uri.parse('$baseUrl/order/new');
      final response = await http.post(
        url,
        headers: prefs.authHeaders,
        body: jsonEncode(body),
      );
      if (response.statusCode != 201) {
        showErrorSnackBar('Try again, Failed to process your order.');
        return;
      }
      showSuccessSnackBar('Your order has been placed successfully.');
    } catch (error) {
      log(error.toString());
    } finally {
      _reorderLoading.value = false;
    }

    log(jsonEncode(body));
  }

  Future<void> reorderAllMeal() async {
    _reorderLoading.value = true;
    final details = _orderDetails.value;
    if (details == null) {
      return;
    } else {
      final body = jsonEncode({
        'items': details.items
            .map((item) => {
                  'meal': item.meal.id,
                  'price': item.meal.price,
                  'quantity': item.quantity,
                  'additives':
                      item.additives.map((additive) => additive.id).toList(),
                })
            .toList(),
        'totalPrice': details.totalPrice,
        'shippingAddress': details.shippingAddress.id,
        "shippingCost": 9.99,
        "discount": 0,
        "deliveryInstruction": details.deliveryInstruction,
        "promotions": [],
      });
      final Uri url = Uri.parse('$baseUrl/order/new');
      try {
        final response = await http.post(
          url,
          headers: prefs.authHeaders,
          body: body,
        );
        if (response.statusCode != 201) {
          showErrorSnackBar('Failed to process your order.');
          return;
        }
        showSuccessSnackBar('Your order created successfully');
      } catch (error) {
        log(error.toString());
      } finally {
        _reorderLoading.value = false;
      }
    }
  }

  Future<void> showReorderConfirmation(
    BuildContext context,
    Function() reorder, {
    String title = 'Confirm Reorder Process',
    String subtitle = 'Are you sure to reorder this order?',
  }) async {
    showCupertinoModalPopup(
        barrierColor: neutral900.withValues(alpha: .5),
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return Material(
            type: MaterialType.transparency,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                width: context.widthByValue(345),
                height: context.heightByValue(160),
                decoration: BoxDecoration(
                  color: primaryWhite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: neutral900,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        subtitle,
                        style: context.textStyle.displaySmall!
                            .copyWith(fontSize: 16.sp),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: TextButton(
                            onPressed: () => Get.back(),
                            child: const Text('Cancel'),
                          ),
                        ),
                        Expanded(
                          child: FButton(
                            size: true,
                            title: 'Confirm',
                            onPressed: () async {
                              Get.back();
                              await reorder();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<void> checkout() async {
    final details = _orderDetails.value;
    if (details == null) {
      return;
    } else {
      _reorderLoading.value = true;
      try {
        final Uri checkoutUrl = Uri.parse('$baseUrl/payment/checkout');
        final checkoutResponse = await http.post(
          checkoutUrl,
          headers: prefs.authHeaders,
          body: jsonEncode({
            'amount': ((details.totalPrice + details.shippingCost) * 100)
                .toStringAsFixed(0),
            'orderId': details.id,
          }),
        );
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
        _reorderLoading.value = false;
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: false,
            merchantDisplayName: 'Food Zone Store',
            paymentIntentClientSecret: checkoutData['paymentIntent'],
            customerEphemeralKeySecret: checkoutData['ephemeralKey'],
            customerId: checkoutData['customer'],
          ),
        );

        await Stripe.instance.presentPaymentSheet().then((v) async {
          await changeOrderStatus(
            'paid',
            paymentIntentId: checkoutData['paymentIntent'],
          );
        });
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
        _reorderLoading.value = false;
      }
    }
  }

  Future<void> changeOrderStatus(String status,
      {String paymentIntentId = '', String reason = ''}) async {
    _reorderLoading.value = true;
    final details = _orderDetails.value;
    if (details == null) {
      return;
    } else {
      final Uri url = Uri.parse('$baseUrl/order/status/$status');
      final body = jsonEncode({
        "orderId": details.id,
        "paymentIntentId": paymentIntentId,
        "reason": reason
      });
      try {
        final response = await http.patch(
          url,
          headers: prefs.authHeaders,
          body: body,
        );
        if (response.statusCode != 200) {
          showErrorSnackBar('Process has been failed.');
          _reorderLoading.value = false;
          return;
        }
        Get.back();
        showSuccessSnackBar('Process completed successfully.');
      } catch (error) {
        log(error.toString());
      } finally {
        _reorderLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    _reviewsTextController.close();
    super.onClose();
  }
}
