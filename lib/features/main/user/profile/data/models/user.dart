import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  final User user;

  UserData({
    required this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  final Name name;
  final Avatar avatar;
  final DateTime dateOfBirth;
  final String id;
  final String facebookId;
  final String slug;
  final String email;
  final int phone;
  final bool phoneVerification;
  final List<dynamic> addresses;
  final List<dynamic> orders;
  final bool isAdmin;
  final List<Favorite> favoriteRestaurants;
  final List<Favorite> favoriteMeals;
  final DateTime createdAt;
  final String accessToken;
  final String refreshToken;
  final String gender;
  final DateTime logout;
  final String userId;

  User({
    required this.name,
    required this.avatar,
    required this.dateOfBirth,
    required this.id,
    required this.facebookId,
    required this.slug,
    required this.email,
    required this.phone,
    required this.phoneVerification,
    required this.addresses,
    required this.orders,
    required this.isAdmin,
    required this.favoriteRestaurants,
    required this.favoriteMeals,
    required this.createdAt,
    required this.accessToken,
    required this.refreshToken,
    required this.gender,
    required this.logout,
    required this.userId,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: Name.fromJson(json["name"]),
        avatar: Avatar.fromJson(json["avatar"]),
        dateOfBirth: DateTime.parse(json["dateOfBirth"]),
        id: json["_id"],
        facebookId: json["facebookId"],
        slug: json["slug"],
        email: json["email"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        isAdmin: json["isAdmin"],
        favoriteRestaurants: List<Favorite>.from(
            json["favoriteRestaurants"].map((x) => Favorite.fromJson(x))),
        favoriteMeals: List<Favorite>.from(
            json["favoriteMeals"].map((x) => Favorite.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        gender: json["gender"],
        logout: DateTime.parse(json["logout"]),
        userId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "avatar": avatar.toJson(),
        "dateOfBirth": dateOfBirth.toIso8601String(),
        "_id": id,
        "facebookId": facebookId,
        "slug": slug,
        "email": email,
        "phone": phone,
        "phoneVerification": phoneVerification,
        "addresses": List<dynamic>.from(addresses.map((x) => x)),
        "orders": List<dynamic>.from(orders.map((x) => x)),
        "isAdmin": isAdmin,
        "favoriteRestaurants":
            List<dynamic>.from(favoriteRestaurants.map((x) => x.toJson())),
        "favoriteMeals":
            List<dynamic>.from(favoriteMeals.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "gender": gender,
        "logout": logout.toIso8601String(),
        "id": userId,
      };
}

class Avatar {
  final String url;
  final String publicId;

  Avatar({
    required this.url,
    required this.publicId,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        url: json["url"],
        publicId: json["publicId"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "publicId": publicId,
      };
}

class Favorite {
  final String meals;
  final bool isAdded;
  final String id;
  final String favoriteId;
  final String restaurant;

  Favorite({
    required this.meals,
    required this.isAdded,
    required this.id,
    required this.favoriteId,
    required this.restaurant,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
        meals: json["meals"],
        isAdded: json["isAdded"],
        id: json["_id"],
        favoriteId: json["id"],
        restaurant: json["restaurant"],
      );

  Map<String, dynamic> toJson() => {
        "meals": meals,
        "isAdded": isAdded,
        "_id": id,
        "id": favoriteId,
        "restaurant": restaurant,
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
