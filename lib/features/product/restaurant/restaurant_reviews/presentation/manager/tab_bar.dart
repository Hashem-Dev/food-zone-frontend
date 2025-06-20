import 'package:food_zone/exports.dart';

class ReviewTabBarController extends GetxController {
  final RxInt _tabIndex = 0.obs;

  void changeIndexSelection(int index) {
    _tabIndex.value = index;
  }

  int get tabIndex => _tabIndex.value;
}
