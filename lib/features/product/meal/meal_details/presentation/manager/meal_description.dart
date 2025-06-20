import 'package:food_zone/exports.dart';

class MealDescriptionController extends GetxController {
  final RxBool _isCollapse = true.obs;

  void changeCollapseState() {
    _isCollapse.value = !_isCollapse.value;
  }

  bool get isCollapsed => _isCollapse.value;
}
