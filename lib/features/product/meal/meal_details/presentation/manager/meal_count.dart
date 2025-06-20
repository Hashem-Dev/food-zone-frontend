import 'package:food_zone/exports.dart';

class MealCountController extends GetxController {
  final RxInt _mealNumber = 1.obs;

  void incrementMealCount() {
    _mealNumber.value++;
  }

  void decrementMealCount() {
    if (_mealNumber > 1) {
      _mealNumber.value--;
    }
  }

  void resetMealCount({int? count}) {
    _mealNumber.value = count ?? 1;
  }

  int get mealCount => _mealNumber.value;
}
