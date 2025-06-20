import 'package:get/get.dart';

class ButtonNavigationBarController extends GetxController {
  final RxInt _selected = 0.obs;

  void selectButton(int index) {
    if (_selected.value != index) {
      navigationHistory.add(_selected.value);
    }
    _selected.value = index;
  }

  int get selected => _selected.value;

  final List<int> navigationHistory = [];

  void handleBackPress() {
    if (navigationHistory.isNotEmpty) {
      _selected.value = navigationHistory.removeLast(); // العودة للتبويب السابق
    }
  }
}
