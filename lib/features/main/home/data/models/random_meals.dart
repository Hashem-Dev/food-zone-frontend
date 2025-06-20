import 'dart:convert';

/// Converts a JSON string to a [RandomMeals] object.
///
/// @param str The JSON string to convert.
/// @returns A [RandomMeals] object.
RandomMeals randomMealsFromJson(String str) =>
    RandomMeals.fromJson(json.decode(str));

/// Converts a [RandomMeals] object to a JSON string.
///
/// @param data The [RandomMeals] object to convert.
/// @returns A JSON string representation of the [RandomMeals] object.
String randomMealsToJson(RandomMeals data) => json.encode(data.toJson());

/// A class representing a collection of random meals.
///
/// Contains a page number and a list of [Meal] objects.
class RandomMeals {
  /// The page number of the random meals.
  final int page;

  /// The list of [Meal] objects.
  final List<Meal> meals;

  /// Constructs a [RandomMeals] object.
  ///
  /// @param page The page number.
  /// @param meals The list of [Meal] objects.
  RandomMeals({
    required this.page,
    required this.meals,
  });

  /// Creates a [RandomMeals] object from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns A [RandomMeals] object.
  factory RandomMeals.fromJson(Map<String, dynamic> json) => RandomMeals(
        page: json["page"],
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  /// Converts the [RandomMeals] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [RandomMeals] object.
  Map<String, dynamic> toJson() => {
        "page": page,
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

/// A class representing a meal.
///
/// Contains details about the meal such as id, title, restaurant, rating, price, and images.
class Meal {
  /// The unique identifier of the meal.
  final String id;

  /// Indicates if the meal is new.
  final bool isNewMeal;

  /// The title of the meal.
  final Title title;

  /// The time associated with the meal.
  final String time;

  /// The restaurant where the meal is available.
  final Restaurant restaurant;

  /// The rating of the meal.
  final double rating;

  /// The price of the meal.
  final double price;

  /// The list of images associated with the meal.
  final List<Image> images;

  /// The price of the meal without any discount.
  final double priceWithoutDiscount;

  /// Constructs a [Meal] object.
  ///
  /// @param id The unique identifier of the meal.
  /// @param isNewMeal Indicates if the meal is new.
  /// @param title The title of the meal.
  /// @param time The time associated with the meal.
  /// @param restaurant The restaurant where the meal is available.
  /// @param rating The rating of the meal.
  /// @param price The price of the meal.
  /// @param images The list of images associated with the meal.
  /// @param priceWithoutDiscount The price of the meal without any discount.
  Meal({
    required this.id,
    required this.isNewMeal,
    required this.title,
    required this.time,
    required this.restaurant,
    required this.rating,
    required this.price,
    required this.images,
    required this.priceWithoutDiscount,
  });

  /// Creates a [Meal] object from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns A [Meal] object.
  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["_id"],
        isNewMeal: json["isNewMeal"],
        title: Title.fromJson(json["title"]),
        time: json["time"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble() ?? 0.0,
      );

  /// Converts the [Meal] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [Meal] object.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "isNewMeal": isNewMeal,
        "title": title.toJson(),
        "time": time,
        "restaurant": restaurant.toJson(),
        "rating": rating,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "priceWithoutDiscount": priceWithoutDiscount,
      };
}

/// A class representing an image.
///
/// Contains the URL and public ID of the image.
class Image {
  /// The URL of the image.
  final String url;

  /// The public ID of the image.
  final String publicId;

  /// Constructs an [Image] object.
  ///
  /// @param url The URL of the image.
  /// @param publicId The public ID of the image.
  Image({
    required this.url,
    required this.publicId,
  });

  /// Creates an [Image] object from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns An [Image] object.
  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        publicId: json["publicId"],
      );

  /// Converts the [Image] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [Image] object.
  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}

/// A class representing a restaurant.
///
/// Contains the title and logo of the restaurant.
class Restaurant {
  /// The title of the restaurant.
  final Title title;

  /// The logo of the restaurant.
  final String logo;

  /// Constructs a [Restaurant] object.
  ///
  /// @param title The title of the restaurant.
  /// @param logo The logo of the restaurant.
  Restaurant({
    required this.title,
    required this.logo,
  });

  /// Creates a [Restaurant] object from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns A [Restaurant] object.
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        title: Title.fromJson(json["title"]),
        logo: json["logo"],
      );

  /// Converts the [Restaurant] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [Restaurant] object.
  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "logo": logo,
      };
}

/// A class representing a title.
///
/// Contains the English and Arabic versions of the title.
class Title {
  /// The English version of the title.
  final String en;

  /// The Arabic version of the title.
  final String ar;

  /// Constructs a [Title] object.
  ///
  /// @param en The English version of the title.
  /// @param ar The Arabic version of the title.
  Title({
    required this.en,
    required this.ar,
  });

  /// Creates a [Title] object from a JSON map.
  ///
  /// @param json The JSON map to convert.
  /// @returns A [Title] object.
  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        ar: json["ar"],
      );

  /// Converts the [Title] object to a JSON map.
  ///
  /// @returns A JSON map representation of the [Title] object.
  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
