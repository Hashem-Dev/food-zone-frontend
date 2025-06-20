import 'dart:convert';

List<RestaurantMeals> restaurantMealsFromJson(String str) =>
    List<RestaurantMeals>.from(
        json.decode(str).map((x) => RestaurantMeals.fromJson(x)));

String restaurantMealsToJson(List<RestaurantMeals> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RestaurantMeals {
  final String id;
  final Title title;
  final String time;
  final double rating;
  final double price;
  final List<Image> images;
  final double priceWithoutDiscount;
  final bool isNewMeal;

  RestaurantMeals({
    required this.id,
    required this.title,
    required this.time,
    required this.rating,
    required this.price,
    required this.images,
    required this.priceWithoutDiscount,
    required this.isNewMeal,
  });

  factory RestaurantMeals.fromJson(Map<String, dynamic> json) =>
      RestaurantMeals(
        id: json["_id"],
        title: Title.fromJson(json["title"]),
        time: json["time"],
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble(),
        isNewMeal: json["isNewMeal"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title.toJson(),
        "time": time,
        "rating": rating,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "priceWithoutDiscount": priceWithoutDiscount,
        "isNewMeal": isNewMeal,
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

class Title {
  final String en;
  final String ar;

  Title({
    required this.en,
    required this.ar,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
