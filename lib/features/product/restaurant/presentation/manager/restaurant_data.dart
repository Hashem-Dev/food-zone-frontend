import 'package:food_zone/exports.dart';
import 'package:food_zone/features/main/home/data/models/restaurant.dart';

class RestaurantDataController extends GetxController {
  final Rxn<Restaurant> _restaurant = Rxn<Restaurant>();
  final language = prefs.userLanguage;

  void setRestaurantData(Restaurant? restaurant) {
    _restaurant.value = restaurant;
  }

  Restaurant? get restaurant => _restaurant.value;

  String getRestaurantTitleForLanguage() {
    if (language == 'en') {
      return restaurant!.title.en;
    } else {
      return restaurant!.title.ar;
    }
  }

  void reFresh() {
    update();
  }
}
