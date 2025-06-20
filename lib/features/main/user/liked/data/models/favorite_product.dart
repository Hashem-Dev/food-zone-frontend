import 'dart:convert';

FavoriteProduct favoriteProductFromJson(String str) =>
    FavoriteProduct.fromJson(json.decode(str));

String favoriteProductToJson(FavoriteProduct data) =>
    json.encode(data.toJson());

class FavoriteProduct {
  final String type;
  final FavoriteProductMeals meals;

  FavoriteProduct({
    required this.type,
    required this.meals,
  });

  factory FavoriteProduct.fromJson(Map<String, dynamic> json) =>
      FavoriteProduct(
        type: json["type"],
        meals: FavoriteProductMeals.fromJson(json["meals"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "meals": meals.toJson(),
      };
}

class FavoriteProductMeals {
  final List<FavoriteMeal> favoriteMeals;

  FavoriteProductMeals({
    required this.favoriteMeals,
  });

  factory FavoriteProductMeals.fromJson(Map<String, dynamic> json) =>
      FavoriteProductMeals(
        favoriteMeals: List<FavoriteMeal>.from(
            json["favoriteMeals"].map((x) => FavoriteMeal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favoriteMeals":
            List<dynamic>.from(favoriteMeals.map((x) => x.toJson())),
      };
}

class FavoriteMeal {
  final FavoriteMealMeals meals;
  final bool isAdded;
  final String id;
  final String favoriteMealId;

  FavoriteMeal({
    required this.meals,
    required this.isAdded,
    required this.id,
    required this.favoriteMealId,
  });

  factory FavoriteMeal.fromJson(Map<String, dynamic> json) => FavoriteMeal(
        meals: FavoriteMealMeals.fromJson(json["meals"]),
        isAdded: json["isAdded"],
        id: json["_id"],
        favoriteMealId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "meals": meals.toJson(),
        "isAdded": isAdded,
        "_id": id,
        "id": favoriteMealId,
      };
}

class FavoriteMealMeals {
  final Title title;
  final String id;
  final String time;
  final Restaurant restaurant;
  final double rating;
  final double price;
  final List<Image> images;
  final double priceWithoutDiscount;
  final String mealsId;

  FavoriteMealMeals({
    required this.title,
    required this.id,
    required this.time,
    required this.restaurant,
    required this.rating,
    required this.price,
    required this.images,
    required this.priceWithoutDiscount,
    required this.mealsId,
  });

  factory FavoriteMealMeals.fromJson(Map<String, dynamic> json) =>
      FavoriteMealMeals(
        title: Title.fromJson(json["title"]),
        id: json["_id"],
        time: json["time"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        rating: json["rating"]?.toDouble(),
        price: json["price"]?.toDouble(),
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        priceWithoutDiscount: json["priceWithoutDiscount"]?.toDouble(),
        mealsId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
        "time": time,
        "restaurant": restaurant.toJson(),
        "rating": rating,
        "price": price,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "priceWithoutDiscount": priceWithoutDiscount,
        "id": mealsId,
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

class Restaurant {
  final Title title;
  final String id;
  final String logo;

  Restaurant({
    required this.title,
    required this.id,
    required this.logo,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        title: Title.fromJson(json["title"]),
        id: json["_id"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "_id": id,
        "logo": logo,
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
