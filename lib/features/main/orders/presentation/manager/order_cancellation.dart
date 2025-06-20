import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/orders/presentation/manager/order_details.dart';

class OrderCancellationLogic extends GetxController {
  static const List<String> cancelReasons = [
    'Change of mind',
    'Found better price elsewhere',
    'Delivery delay',
    'Incorrect item selected',
    'Duplicate order',
    'Unable to fulfill order',
    'Other reasons',
  ];

  TextEditingController otherReasonController = TextEditingController();
  final OrderDetailsLogic _detailsLogic = Get.find();

  final RxString _groupValue = ''.obs;

  set groupValue(String value) {
    otherReasonController.clear();
    _groupValue.value = value;
  }

  String get groupValue => _groupValue.value;

  Future<void> submitOrderCancellation() async {
    final String controllerText = otherReasonController.text;
    String reason = '';
    if (controllerText.isNotEmpty) {
      reason = controllerText;
    }

    final index = int.parse(_groupValue.value);
    final selectedIndex = cancelReasons[index];
    if (selectedIndex != cancelReasons.last) {
      reason = selectedIndex;
    }
    await _detailsLogic.changeOrderStatus('cancelled', reason: reason);
  }

  @override
  void onInit() {
    otherReasonController;
    super.onInit();
  }
}
