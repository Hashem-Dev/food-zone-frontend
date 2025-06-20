import 'package:food_zone/exports.dart';

class RestaurantTabBarController extends GetxController {
  final RxInt _index = 0.obs;

  void changeTabBarIndex(int index) {
    _index.value = index;
  }

  int get index => _index.value;
}
