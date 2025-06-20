import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/user/basket/data/models/basket_meal.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_details.dart';

class BasketItemsController extends GetxController {
  final RxList<BasketMeal> _basketItems = prefs.userBasketItems.obs;
  final RxInt _basketItemsCount = prefs.userBasketItems.length.obs;

  final RxBool _addedToBasket = false.obs;
  final MealDetailsController _mealDetailsController = Get.find();
  final MealCountController _mealCountController = Get.find();
  final Rxn<BasketMeal> _basketMeal = Rxn<BasketMeal>();
  final RxList<SelectedAdditives> _updatedAdditives = <SelectedAdditives>[].obs;

  BasketMeal? get basketMeal => _basketMeal.value;

  void setBasketMeal({BasketMeal? meal, String? mealId}) {
    if (meal != null) {
      _basketMeal.value = meal;
      return;
    } else if (mealId != null) {
      _basketItems.firstWhereOrNull((meal) {
        if (meal.mealId == mealId) {
          _basketMeal.value = meal;
          return true;
        }
        return false;
      });
    }
  }

  // void setSelectedAdditives(List<SelectedAdditives> selectedAdditives) {
  //   _selectedAdditives.value = selectedAdditives;
  // }

  void setUpdatedAdditives(List<SelectedAdditives> updatedAdditives) {
    _updatedAdditives.value = updatedAdditives;
  }

  /* Add new meal to the basket. */
  void addToBasket(BasketMeal meal) {
    meal.mealCount = _mealCountController.mealCount;
    _basketMeal.value = meal;
    if (!(_basketItems.contains(meal))) {
      _basketItems.add(meal);
      meal.mealCount = _mealCountController.mealCount;
      meal.addedToBasket = true;
    } else if (_basketItems.contains(meal)) {
      final foundMeal = _basketItems.indexOf(meal);
      if (foundMeal != -1) {
        meal.mealCount = _mealCountController.mealCount;
        meal.selectedAdditives = _updatedAdditives;
        _basketItems[foundMeal] = meal;
      }
    }
    _basketItemsCount.value = _basketItems.length;
    prefs.saveUserBasketItem(_basketItems);
    prefs.saveMealAdditives(
      mealId: meal.mealId,
      additives: _updatedAdditives,
    );
    prefs.saveMealCount(
        mealId: meal.mealId, count: _mealCountController.mealCount);
  }

  /* Remove specific meal from the basket. */
  bool removeFromBasket(String mealId) {
    _basketItems.any((item) {
      if (item.mealId == mealId) {
        if (_basketItems.contains(item)) {
          _basketItems.remove(item);
          item.addedToBasket = false;
          prefs.saveUserBasketItem(_basketItems);
          prefs.removeSavedMealAdditives(item.mealId);
          prefs.removeSavedMealCount(item.mealId);
          _mealDetailsController.setAdditives([]);
          _mealCountController.resetMealCount();
          _basketItemsCount.value = _basketItems.length;
          return true;
        }
        return false;
      } else {
        return false;
      }
    });
    return true;
  }

  /* Check if the meal added to the basket. */
  bool addedToBasket(String mealId) {
    final bool mealSelected = _basketItems.any((meal) => meal.mealId == mealId);
    _addedToBasket.value = mealSelected;
    return mealSelected;
  }

  int get basketItemCount => _basketItemsCount.value;
}
