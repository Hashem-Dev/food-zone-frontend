import 'dart:convert';

/// Converts a JSON string into a [SearchResponse] object.
///
/// @param str The JSON string to be converted.
/// @returns A [SearchResponse] object.
SearchResponse searchResponseFromJson(String str) =>
    SearchResponse.fromJson(json.decode(str));

/// Converts a [SearchResponse] object into a JSON string.
///
/// @param data The [SearchResponse] object to be converted.
/// @returns A JSON string.
String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

/// Represents the response of a search query, containing categories, meals, and restaurants.
class SearchResponse {
  /// A list of categories.
  final List<Category> categories;

  /// A list of meals.
  final List<Meal> meals;

  /// A list of restaurants.
  final List<Restaurant> restaurants;

  /// Constructs a [SearchResponse] object.
  ///
  /// @param categories The list of categories.
  /// @param meals The list of meals.
  /// @param restaurants The list of restaurants.
  SearchResponse({
    required this.categories,
    required this.meals,
    required this.restaurants,
  });

  /// Creates a [SearchResponse] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [SearchResponse] object.
  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  /// Converts the [SearchResponse] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}

/// Represents a category with an ID, icon, and title.
class Category {
  /// The ID of the category.
  final String id;

  /// The icon of the category.
  final String icon;

  /// The title of the category.
  final CategoryTitle title;

  /// Constructs a [Category] object.
  ///
  /// @param id The ID of the category.
  /// @param icon The icon of the category.
  /// @param title The title of the category.
  Category({
    required this.id,
    required this.icon,
    required this.title,
  });

  /// Creates a [Category] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Category] object.
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        icon: json["icon"],
        title: CategoryTitle.fromJson(json["title"]),
      );

  /// Converts the [Category] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "icon": icon,
        "title": title.toJson(),
      };
}

/// Represents the title of a category in different languages.
class CategoryTitle {
  /// The Arabic title.
  final String ar;

  /// The English title.
  final String en;

  /// Constructs a [CategoryTitle] object.
  ///
  /// @param ar The Arabic title.
  /// @param en The English title.
  CategoryTitle({
    required this.ar,
    required this.en,
  });

  /// Creates a [CategoryTitle] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [CategoryTitle] object.
  factory CategoryTitle.fromJson(Map<String, dynamic> json) => CategoryTitle(
        ar: json["ar"],
        en: json["en"],
      );

  /// Converts the [CategoryTitle] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

/// Represents a meal with an ID, images, new meal status, offer status, rating, and title.
class Meal {
  /// The ID of the meal.
  final String id;

  /// The list of images of the meal.
  final List<Image> images;

  /// Indicates if the meal is new.
  final bool isNewMeal;

  /// Indicates if the meal is on offer.
  final bool isOffer;

  /// The rating of the meal.
  final double rating;

  /// The title of the meal.
  final MealTitle title;

  /// Constructs a [Meal] object.
  ///
  /// @param id The ID of the meal.
  /// @param images The list of images of the meal.
  /// @param isNewMeal Indicates if the meal is new.
  /// @param isOffer Indicates if the meal is on offer.
  /// @param rating The rating of the meal.
  /// @param title The title of the meal.
  Meal({
    required this.id,
    required this.images,
    required this.isNewMeal,
    required this.isOffer,
    required this.rating,
    required this.title,
  });

  /// Creates a [Meal] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Meal] object.
  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json["_id"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        isNewMeal: json["isNewMeal"],
        isOffer: json["isOffer"],
        rating: json["rating"]?.toDouble(),
        title: MealTitle.fromJson(json["title"]),
      );

  /// Converts the [Meal] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "isNewMeal": isNewMeal,
        "isOffer": isOffer,
        "rating": rating,
        "title": title.toJson(),
      };
}

/// Represents an image with a public ID and URL.
class Image {
  /// The public ID of the image.
  final String publicId;

  /// The URL of the image.
  final String url;

  /// Constructs an [Image] object.
  ///
  /// @param publicId The public ID of the image.
  /// @param url The URL of the image.
  Image({
    required this.publicId,
    required this.url,
  });

  /// Creates an [Image] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns An [Image] object.
  factory Image.fromJson(Map<String, dynamic> json) => Image(
        publicId: json["publicId"],
        url: json["url"],
      );

  /// Converts the [Image] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "publicId": publicId,
        "url": url,
      };
}

/// Represents the title of a meal in different languages.
class MealTitle {
  /// The Arabic title.
  final String ar;

  /// The English title.
  final String en;

  /// Constructs a [MealTitle] object.
  ///
  /// @param ar The Arabic title.
  /// @param en The English title.
  MealTitle({
    required this.ar,
    required this.en,
  });

  /// Creates a [MealTitle] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [MealTitle] object.
  factory MealTitle.fromJson(Map<String, dynamic> json) => MealTitle(
        ar: json["ar"],
        en: json["en"],
      );

  /// Converts the [MealTitle] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}

/// Represents a restaurant with an ID, cover image, logo, rating, and title.
class Restaurant {
  /// The ID of the restaurant.
  final String id;

  /// The cover image of the restaurant.
  final String cover;

  /// The logo of the restaurant.
  final String logo;

  /// The rating of the restaurant.
  final double rating;

  /// The title of the restaurant.
  final RestaurantTitle title;

  /// Constructs a [Restaurant] object.
  ///
  /// @param id The ID of the restaurant.
  /// @param cover The cover image of the restaurant.
  /// @param logo The logo of the restaurant.
  /// @param rating The rating of the restaurant.
  /// @param title The title of the restaurant.
  Restaurant({
    required this.id,
    required this.cover,
    required this.logo,
    required this.rating,
    required this.title,
  });

  /// Creates a [Restaurant] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Restaurant] object.
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        cover: json["cover"],
        logo: json["logo"],
        rating: json["rating"]?.toDouble(),
        title: RestaurantTitle.fromJson(json["title"]),
      );

  /// Converts the [Restaurant] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "cover": cover,
        "logo": logo,
        "rating": rating,
        "title": title.toJson(),
      };
}

/// Represents the title of a restaurant in different languages.
class RestaurantTitle {
  /// The Arabic title.
  final String ar;

  /// The English title.
  final String en;

  /// Constructs a [RestaurantTitle] object.
  ///
  /// @param ar The Arabic title.
  /// @param en The English title.
  RestaurantTitle({
    required this.ar,
    required this.en,
  });

  /// Creates a [RestaurantTitle] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [RestaurantTitle] object.
  factory RestaurantTitle.fromJson(Map<String, dynamic> json) =>
      RestaurantTitle(
        ar: json["ar"],
        en: json["en"],
      );

  /// Converts the [RestaurantTitle] object into a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
      };
}
