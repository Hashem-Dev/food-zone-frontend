import 'dart:async';

import 'package:food_zone/exports.dart';

import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';
import 'package:food_zone/features/product/meal/meal_details/presentation/manager/meal_count.dart';

class MealDetailsController extends GetxController {
  final language = prefs.userLanguage;
  PageController imagesController = PageController();

  late Timer timer;
  final RxInt _page = 0.obs;
  final Rxn<MealModel> _mealDetails = Rxn<MealModel>();
  final RxDouble _additivePrice = 0.0.obs;
  late final RxList<SelectedAdditives> _selectedAdditives =
      getSavedAdditives().obs;
  late final MealCountController _mealCountController = Get.find();

  void setAdditives(List<SelectedAdditives> additives) {
    _selectedAdditives.value = additives;
  }

  /* Retrieve saved additives for specific meal. */
  List<SelectedAdditives> getSavedAdditives() {
    final mealId = mealDetails?.id;
    if (mealId == null) {
      return [];
    }
    final savedList = prefs.selectedMealAdditives(mealId: mealId);
    return savedList;
  }

  /* Retrieve saved count for specific meal. */
  void getSavedMealCount() {
    final mealId = mealDetails?.id;
    if (mealId == null) {
      return;
    }
    final mealCount = prefs.mealItemCount(mealId);
    _mealCountController.resetMealCount(count: mealCount);
    return;
  }

  /* Save current additives for specific meal. */
  void selectAdditives(SelectedAdditives additive, double price) {
    if (!_selectedAdditives.contains(additive)) {
      _selectedAdditives.add(additive);
      additive.additiveSelected = true;
      _additivePrice.value += price;
    } else {
      _selectedAdditives.remove(additive);
      additive.additiveSelected = false;
      _additivePrice.value -= price;
    }
  }

  List<SelectedAdditives> get selectedAdditives => _selectedAdditives;

  void changeIndex(int index) => _page.value = index;

  int get page => _page.value;

  /* Set specific meal details to the global variable. */
  void setMealDetails(MealModel? meal) {
    _mealDetails.value = meal;
  }

  MealModel? get mealDetails => _mealDetails.value;

  /* Get food tags meal for specific language. */
  List<String>? foodTagsForLanguage() {
    if (language == 'en') {
      return mealDetails?.foodTags.en;
    } else {
      return mealDetails?.foodTags.ar;
    }
  }

  /* Get description meal for specific language. */
  String? descriptionForLanguage() {
    if (language == 'en') {
      return mealDetails?.description.en;
    } else {
      return mealDetails?.description.ar;
    }
  }

  /* Get title meal for specific language. */
  String? getMealTitleForLanguage() {
    if (language == 'en') {
      return mealDetails?.title.en;
    } else {
      return mealDetails?.title.ar;
    }
  }

  double get additivePrice => _additivePrice.value;

  @override
  void onInit() {
    /* Create image slider for meal images */
    imagesController = PageController(initialPage: _page.value);
    timer = Timer.periodic(const Duration(seconds: 6), (Timer t) {
      if (imagesController.hasClients) {
        if (_page.value < (mealDetails?.images.length ?? 1) - 1) {
          _page.value++;
        } else {
          _page.value = 0;
        }
        imagesController.animateToPage(
          _page.value,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });

    super.onInit();
  }

  @override
  void dispose() {
    timer.cancel();
    imagesController.dispose();
    super.dispose();
  }
}
