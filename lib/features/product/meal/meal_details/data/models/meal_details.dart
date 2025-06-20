import 'dart:convert';

MealModel mealModelFromJson(String str) => MealModel.fromJson(json.decode(str));

String mealModelToJson(MealModel data) => json.encode(data.toJson());

class MealModel {
  final Description title;
  final FoodT foodTags;
  final FoodT foodType;
  final Coords coords;
  final Description description;
  final NutritionalInfo nutritionalInfo;
  final double priceWithoutDiscount;
  final String id;
  final String time;
  final Category category;
  final bool isAvailable;
  final Restaurant restaurant;
  final double rating;
  final String ratingCount;
  final double price;
  final List<Additive> additives;
  final List<Image> images;
  final List<dynamic> reviews;
  final DateTime createdAt;

  final bool isNewMeal;

  MealModel({
    required this.title,
    required this.foodTags,
    required this.foodType,
    required this.coords,
    required this.description,
    required this.nutritionalInfo,
    required this.priceWithoutDiscount,
    required this.id,
    required this.time,
    required this.category,
    required this.isAvailable,
    required this.restaurant,
    required this.rating,
    required this.ratingCount,
    required this.price,
    required this.additives,
    required this.images,
    required this.reviews,
    required this.createdAt,
    required this.isNewMeal,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        title: Description.fromJson(json["title"]),
        foodTags: FoodT.fromJson(json["foodTags"]),
        foodType: FoodT.fromJson(json["foodType"]),
        coords: Coords.fromJson(json["coords"]),
        description: Description.fromJson(json["description"]),
        nutritionalInfo: NutritionalInfo.fromJson(json["nutritionalInfo"]),
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble() ?? 0.0,
        id: json["_id"],
        time: json["time"],
        category: Category.fromJson(json["category"]),
        isAvailable: json["isAvailable"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        rating: json["rating"]?.toDouble() ?? 0.0,
        ratingCount: json["ratingCount"],
        price: json["price"]?.toDouble(),
        additives: List<Additive>.from(
            json["additives"].map((x) => Additive.fromJson(x))),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        isNewMeal: json["isNewMeal"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "foodTags": foodTags.toJson(),
        "foodType": foodType.toJson(),
        "coords": coords.toJson(),
        "description": description.toJson(),
        "nutritionalInfo": nutritionalInfo.toJson(),
        "priceWithoutDiscount": priceWithoutDiscount,
        "_id": id,
        "time": time,
        "category": category.toJson(),
        "isAvailable": isAvailable,
        "restaurant": restaurant.toJson(),
        "rating": rating,
        "ratingCount": ratingCount,
        "price": price,
        "additives": List<dynamic>.from(additives.map((x) => x.toJson())),
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "isNewMeal": isNewMeal,
      };
}

class Additive {
  final Description title;
  final Description description;
  final String id;
  final double price;
  final String type;

  Additive({
    required this.title,
    required this.description,
    required this.id,
    required this.price,
    required this.type,
  });

  factory Additive.fromJson(Map<String, dynamic> json) => Additive(
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        id: json["_id"],
        price: json["price"]?.toDouble(),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "description": description.toJson(),
        "_id": id,
        "price": price,
        "type": type,
      };
}

class Description {
  final String en;
  final String ar;

  Description({
    required this.en,
    required this.ar,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}

class Category {
  final Description title;
  final String id;

  Category({
    required this.title,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        title: Description.fromJson(json["title"]),
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
      };
}

class Coords {
  final double latitude;
  final double longitude;

  Coords({
    required this.latitude,
    required this.longitude,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class FoodT {
  final List<String> en;
  final List<String> ar;

  FoodT({
    required this.en,
    required this.ar,
  });

  factory FoodT.fromJson(Map<String, dynamic> json) => FoodT(
        en: List<String>.from(json["en"].map((x) => x)),
        ar: List<String>.from(json["ar"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "en": List<dynamic>.from(en.map((x) => x)),
        "ar": List<dynamic>.from(ar.map((x) => x)),
      };
}

class Image {
  final String url;
  final String publicId;

  Image({
    required this.url,
    required this.publicId,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        publicId: json["publicId"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}

class NutritionalInfo {
  final String calories;
  final String protein;
  final String carbs;
  final String fat;

  NutritionalInfo({
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory NutritionalInfo.fromJson(Map<String, dynamic> json) =>
      NutritionalInfo(
        calories: json["calories"],
        protein: json["protein"],
        carbs: json["carbs"],
        fat: json["fat"],
      );

  Map<String, dynamic> toJson() => {
        "calories": calories,
        "protein": protein,
        "carbs": carbs,
        "fat": fat,
      };
}

class Restaurant {
  final Description title;
  final String id;
  final String owner;

  Restaurant({
    required this.title,
    required this.id,
    required this.owner,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        title: Description.fromJson(json["title"]),
        id: json["_id"],
        owner: json["owner"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
        "owner": owner,
      };
}
