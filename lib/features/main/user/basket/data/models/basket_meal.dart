import 'package:food_zone/features/product/meal/meal_details/data/models/meal_details.dart';
import 'package:food_zone/features/product/meal/meal_details/data/models/selected_additives.dart';

class BasketMeal {
  final String mealId;
  final String coverUrl;
  final Description mealTitle;
  List<SelectedAdditives> selectedAdditives;
  int mealCount;
  final double price;
  final double? priceBeforeDiscount;
  bool addedToBasket;

  BasketMeal({
    required this.mealId,
    required this.selectedAdditives,
    required this.price,
    required this.coverUrl,
    required this.mealTitle,
    this.mealCount = 1,
    this.addedToBasket = false,
    this.priceBeforeDiscount,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasketMeal && other.mealId == mealId;
  }

  @override
  int get hashCode => mealId.hashCode;

  Map<String, dynamic> basketItemToJson() {
    return {
      'id': mealId,
      'added': addedToBasket,
      'mealCount': mealCount,
      'price': price,
      'priceBeforeDiscount': priceBeforeDiscount,
      'coverUrl': coverUrl,
      'mealTitle': mealTitle.toJson(),
      'selectedAdditives': selectedAdditives.map((additive) {
        return additive.toJson();
      }).toList(),
    };
  }

  factory BasketMeal.fromJson(Map<String, dynamic> json) {
    return BasketMeal(
      mealId: json['id'],
      coverUrl: json['coverUrl'],
      addedToBasket: json['added'],
      mealCount: json['mealCount'] ?? 0,
      price: json['price'] ?? 0,
      priceBeforeDiscount: json['priceBeforeDiscount'],
      mealTitle: Description.fromJson(json['mealTitle']),
      selectedAdditives: (json['selectedAdditives'] as List<dynamic>?)
              ?.map((additiveJson) => SelectedAdditives.fromJson(
                  additiveJson as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}
