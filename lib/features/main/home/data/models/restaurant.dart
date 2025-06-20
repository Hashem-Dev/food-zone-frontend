import 'dart:convert';

/// Converts a JSON string to a [RandomRestaurant] object.
///
/// @param str The JSON string to be converted.
/// @returns A [RandomRestaurant] object.
RandomRestaurant randomRestaurantFromJson(String str) =>
    RandomRestaurant.fromJson(json.decode(str));

/// Converts a [RandomRestaurant] object to a JSON string.
///
/// @param data The [RandomRestaurant] object to be converted.
/// @returns A JSON string.
String randomRestaurantToJson(RandomRestaurant data) =>
    json.encode(data.toJson());

/// Represents a random restaurant response.
///
/// Contains the status, code, message, and a list of [Restaurant] objects.
class RandomRestaurant {
  final String status;
  final int code;
  final String message;
  final List<Restaurant> data;

  /// Constructs a [RandomRestaurant] object.
  ///
  /// @param status The status of the response.
  /// @param code The response code.
  /// @param message The response message.
  /// @param data The list of [Restaurant] objects.
  RandomRestaurant({
    required this.status,
    required this.code,
    required this.message,
    required this.data,
  });

  /// Creates a [RandomRestaurant] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [RandomRestaurant] object.
  factory RandomRestaurant.fromJson(Map<String, dynamic> json) =>
      RandomRestaurant(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Restaurant>.from(
            json["data"].map((x) => Restaurant.fromJson(x))),
      );

  /// Converts the [RandomRestaurant] object to a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

/// Represents a restaurant.
///
/// Contains various details about the restaurant such as id, title, time, cover, foods, pickup, delivery, availability, owner, logo, rating, rating count, verification, coordinates, and version.
class Restaurant {
  final String id;
  final Title title;
  final String time;
  final String cover;
  final List<String> foods;
  final bool pickup;
  final bool delivery;
  final bool isAvailable;
  final String owner;
  final String logo;
  final double rating;
  final String ratingCount;
  final String verification;
  final Coords coords;
  final int v;

  /// Constructs a [Restaurant] object.
  ///
  /// @param id The restaurant id.
  /// @param title The title of the restaurant.
  /// @param time The time of the restaurant.
  /// @param cover The cover image of the restaurant.
  /// @param foods The list of foods available at the restaurant.
  /// @param pickup Whether the restaurant offers pickup.
  /// @param delivery Whether the restaurant offers delivery.
  /// @param isAvailable Whether the restaurant is available.
  /// @param owner The owner of the restaurant.
  /// @param logo The logo of the restaurant.
  /// @param rating The rating of the restaurant.
  /// @param ratingCount The rating count of the restaurant.
  /// @param verification The verification status of the restaurant.
  /// @param coords The coordinates of the restaurant.
  /// @param v The version of the restaurant data.
  Restaurant({
    required this.id,
    required this.title,
    required this.time,
    required this.cover,
    required this.foods,
    required this.pickup,
    required this.delivery,
    required this.isAvailable,
    required this.owner,
    required this.logo,
    required this.rating,
    required this.ratingCount,
    required this.verification,
    required this.coords,
    required this.v,
  });

  /// Creates a [Restaurant] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Restaurant] object.
  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["_id"],
        title: Title.fromJson(json["title"]),
        time: json["time"],
        cover: json["cover"],
        foods: List<String>.from(json["foods"].map((x) => x)),
        pickup: json["pickup"],
        delivery: json["delivery"],
        isAvailable: json["isAvailable"],
        owner: json["owner"],
        logo: json["logo"],
        rating: json["rating"]?.toDouble(),
        ratingCount: json["ratingCount"],
        verification: json["verification"],
        coords: Coords.fromJson(json["coords"]),
        v: json["__v"],
      );

  /// Converts the [Restaurant] object to a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title.toJson(),
        "time": time,
        "cover": cover,
        "foods": List<dynamic>.from(foods.map((x) => x)),
        "pickup": pickup,
        "delivery": delivery,
        "isAvailable": isAvailable,
        "owner": owner,
        "logo": logo,
        "rating": rating,
        "ratingCount": ratingCount,
        "verification": verification,
        "coords": coords.toJson(),
        "__v": v,
      };
}

/// Represents the coordinates of a restaurant.
///
/// Contains the latitude, longitude, address, title, latitude delta, and longitude delta.
class Coords {
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  /// Constructs a [Coords] object.
  ///
  /// @param latitude The latitude of the coordinates.
  /// @param longitude The longitude of the coordinates.
  /// @param address The address of the coordinates.
  /// @param title The title of the coordinates.
  /// @param latitudeDelta The latitude delta of the coordinates.
  /// @param longitudeDelta The longitude delta of the coordinates.
  Coords({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  /// Creates a [Coords] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Coords] object.
  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
      );

  /// Converts the [Coords] object to a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
      };
}

/// Represents the title of a restaurant in different languages.
///
/// Contains the English and Arabic titles.
class Title {
  final String en;
  final String ar;

  /// Constructs a [Title] object.
  ///
  /// @param en The English title.
  /// @param ar The Arabic title.
  Title({required this.en, required this.ar});

  /// Creates a [Title] object from a JSON map.
  ///
  /// @param json The JSON map to be converted.
  /// @returns A [Title] object.
  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(en: json["en"], ar: json["ar"]);
  }

  /// Converts the [Title] object to a JSON map.
  ///
  /// @returns A JSON map.
  Map<String, dynamic> toJson() => {"en": en, "ar": ar};
}
