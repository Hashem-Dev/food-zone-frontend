import 'dart:convert';

List<ProductRating> productRatingFromJson(String str) =>
    List<ProductRating>.from(
        json.decode(str).map((x) => ProductRating.fromJson(x)));

String productRatingToJson(List<ProductRating> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductRating {
  final String id;
  final User user;
  final String ratingType;
  final double rating;
  final String review;
  final bool isPositive;
  final DateTime createdAt;

  ProductRating({
    required this.id,
    required this.user,
    required this.ratingType,
    required this.rating,
    required this.review,
    required this.isPositive,
    required this.createdAt,
  });

  factory ProductRating.fromJson(Map<String, dynamic> json) => ProductRating(
        id: json["_id"],
        user: User.fromJson(json["user"]),
        ratingType: json["ratingType"],
        rating: json["rating"]?.toDouble(),
        review: json["review"],
        isPositive: json["isPositive"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user.toJson(),
        "ratingType": ratingType,
        "rating": rating,
        "review": review,
        "isPositive": isPositive,
        "createdAt": createdAt.toIso8601String(),
      };
}

class User {
  final Name name;
  final Avatar avatar;
  final String id;
  final String userId;

  User({
    required this.name,
    required this.avatar,
    required this.id,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: Name.fromJson(json["name"]),
        avatar: Avatar.fromJson(json["avatar"]),
        id: json["_id"],
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "avatar": avatar.toJson(),
        "_id": id,
        "id": userId,
      };
}

class Avatar {
  final String url;

  Avatar({
    required this.url,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

class Name {
  final String en;
  final String ar;

  Name({
    required this.en,
    required this.ar,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        en: json["en"],
        ar: json["ar"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
