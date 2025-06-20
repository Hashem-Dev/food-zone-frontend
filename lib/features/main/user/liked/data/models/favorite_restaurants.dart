import 'dart:convert';

FavoriteRestaurants favoriteRestaurantsFromJson(String str) =>
    FavoriteRestaurants.fromJson(json.decode(str));

String favoriteRestaurantsToJson(FavoriteRestaurants data) =>
    json.encode(data.toJson());

class FavoriteRestaurants {
  final String type;
  final Restaurants restaurants;

  FavoriteRestaurants({
    required this.type,
    required this.restaurants,
  });

  factory FavoriteRestaurants.fromJson(Map<String, dynamic> json) =>
      FavoriteRestaurants(
        type: json["type"],
        restaurants: Restaurants.fromJson(json["restaurants"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "restaurants": restaurants.toJson(),
      };
}

class Restaurants {
  final List<FavoriteRestaurant> favoriteRestaurants;

  Restaurants({
    required this.favoriteRestaurants,
  });

  factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
        favoriteRestaurants: List<FavoriteRestaurant>.from(
            json["favoriteRestaurants"]
                .map((x) => FavoriteRestaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "favoriteRestaurants":
            List<dynamic>.from(favoriteRestaurants.map((x) => x.toJson())),
      };
}

class FavoriteRestaurant {
  final Restaurant restaurant;
  final bool isAdded;

  FavoriteRestaurant({
    required this.restaurant,
    required this.isAdded,
  });

  factory FavoriteRestaurant.fromJson(Map<String, dynamic> json) =>
      FavoriteRestaurant(
        restaurant: Restaurant.fromJson(json["restaurant"]),
        isAdded: json["isAdded"],
      );

  Map<String, dynamic> toJson() => {
        "restaurant": restaurant.toJson(),
        "isAdded": isAdded,
      };
}

class Restaurant {
  final Title title;
  final Coords coords;
  final String id;
  final String time;
  final String cover;
  final String logo;
  final double rating;
  final String restaurantId;

  Restaurant({
    required this.title,
    required this.coords,
    required this.id,
    required this.time,
    required this.cover,
    required this.logo,
    required this.rating,
    required this.restaurantId,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        title: Title.fromJson(json["title"]),
        coords: Coords.fromJson(json["coords"]),
        id: json["_id"],
        time: json["time"],
        cover: json["cover"],
        logo: json["logo"],
        rating: json["rating"]?.toDouble(),
        restaurantId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title.toJson(),
        "coords": coords.toJson(),
        "_id": id,
        "time": time,
        "cover": cover,
        "logo": logo,
        "rating": rating,
        "id": restaurantId,
      };
}

class Coords {
  final double latitude;
  final double longitude;
  final String address;
  final String title;
  final double latitudeDelta;
  final double longitudeDelta;

  Coords({
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.title,
    required this.latitudeDelta,
    required this.longitudeDelta,
  });

  factory Coords.fromJson(Map<String, dynamic> json) => Coords(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        address: json["address"],
        title: json["title"],
        latitudeDelta: json["latitudeDelta"]?.toDouble(),
        longitudeDelta: json["longitudeDelta"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "title": title,
        "latitudeDelta": latitudeDelta,
        "longitudeDelta": longitudeDelta,
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
