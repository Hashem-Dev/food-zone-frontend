import 'dart:convert';

/// Converts a JSON string into a list of `CategoryMealsData` objects.
///
/// @param str The JSON string to be converted.
/// @returns A list of `CategoryMealsData` objects.
List<CategoryMealsData> categoryMealsDataFromJson(String str) =>
    List<CategoryMealsData>.from(
        json.decode(str).map((x) => CategoryMealsData.fromJson(x)));

/// Converts a list of `CategoryMealsData` objects into a JSON string.
///
/// @param data The list of `CategoryMealsData` objects to be converted.
/// @returns A JSON string representation of the list.
String categoryMealsDataToJson(List<CategoryMealsData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Represents the data for a category meal.
class CategoryMealsData {
  final Title title;
  final String id;
  final String time;
  final Restaurant restaurant;
  final double rating;
  final double price;
  final List<Image> images;
  final bool isNewMeal;
  final double priceWithoutDiscount;

  /// Creates a new `CategoryMealsData` instance.
  ///
  /// @param title The title of the meal.
  /// @param id The ID of the meal.
  /// @param time The time associated with the meal.
  /// @param restaurant The restaurant offering the meal.
  /// @param rating The rating of the meal.
  /// @param price The price of the meal.
  /// @param images The images of the meal.
  /// @param isNewMeal Whether the meal is new.
  /// @param priceWithoutDiscount The price of the meal without discount.
  CategoryMealsData({
    required this.title,
    required this.id,
    required this.time,
    required this.restaurant,
    required this.rating,
    required this.price,
    required this.images,
    required this.isNewMeal,
    required this.priceWithoutDiscount,
  });

  /// Creates a new `CategoryMealsData` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `CategoryMealsData` instance.
  factory CategoryMealsData.fromJson(Map<String, dynamic> json) =>
      CategoryMealsData(
        title: Title.fromJson(json["title"]),
        id: json["_id"],
        time: json["time"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        isNewMeal: json["isNewMeal"],
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble() ?? 0.0,
      );

  /// Converts the `CategoryMealsData` instance into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
        "time": time,
        "restaurant": restaurant.toJson(),
        "rating": rating,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "isNewMeal": isNewMeal,
        "priceWithoutDiscount": priceWithoutDiscount,
      };
}

/// Represents an image with a URL and a public ID.
class Image {
  final String url;
  final String publicId;

  /// Creates a new `Image` instance.
  ///
  /// @param url The URL of the image.
  /// @param publicId The public ID of the image.
  Image({
    required this.url,
    required this.publicId,
  });

  /// Creates a new `Image` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `Image` instance.
  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        publicId: json["publicId"],
      );

  /// Converts the `Image` instance into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}

/// Represents a restaurant with a title, ID, and logo.
class Restaurant {
  final Title title;
  final String id;
  final String logo;

  /// Creates a new `Restaurant` instance.
  ///
  /// @param title The title of the restaurant.
  /// @param id The ID of the restaurant.
  /// @param logo The logo of the restaurant.
  Restaurant({
    required this.title,
    required this.id,
    required this.logo,
  });

  /// Creates a new `Restaurant` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `Restaurant` instance.
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        title: Title.fromJson(json["title"]),
        id: json["_id"],
        logo: json["logo"],
      );

  /// Converts the `Restaurant` instance into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
        "logo": logo,
      };
}

/// Represents a title with English and Arabic translations.
class Title {
  final String en;
  final String ar;

  /// Creates a new `Title` instance.
  ///
  /// @param en The English translation of the title.
  /// @param ar The Arabic translation of the title.
  Title({
    required this.en,
    required this.ar,
  });

  /// Creates a new `Title` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `Title` instance.
  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        ar: json["ar"],
      );

  /// Converts the `Title` instance into a JSON object.
  ///
  /// @returns A JSON object representation of the instance.
  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
