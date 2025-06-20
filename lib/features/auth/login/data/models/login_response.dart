import 'dart:convert';

/// Represents the response received after a login attempt.
///
/// Example usage:
/// ```dart
/// final response = loginResponseFromJson(jsonString);
/// print(response.user.email);
/// ```
class LoginResponse {
  /// The user information contained in the login response.
  final User user;

  /// Constructs a [LoginResponse] with the given [user].
  LoginResponse({
    required this.user,
  });

  /// Creates a [LoginResponse] from a JSON map.
  ///
  /// If the "user" field is null, it returns a default [User] object.
  ///
  /// @param json The JSON map to parse.
  /// @returns A [LoginResponse] object.
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    if (json["user"] == null) {
      return LoginResponse(
        user: User(
          name: Name(en: 'en', ar: 'ar'),
          avatar: Avatar(
            url:
                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
            publicId: 'publicId',
          ),
          dateOfBirth: DateTime.now(),
          id: 'id',
          slug: 'slug',
          email: 'email',
          phone: 0,
          phoneVerification: false,
          addresses: [],
          orders: [],
          role: 'role',
          isAdmin: false,
          favoriteRestaurants: [],
          favoriteMeals: [],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          accessToken: 'accessToken',
          refreshToken: 'refreshToken',
          gender: 'gender',
          logout: DateTime.now(),
        ),
      );
    }

    return LoginResponse(
      user: User.fromJson(json["user"]),
    );
  }
}

/// Represents a user in the system.
///
/// Example usage:
/// ```dart
/// final user = User.fromJson(jsonMap);
/// print(user.name.en);
/// ```
class User {
  /// The user's name.
  final Name name;

  /// The user's avatar.
  final Avatar avatar;

  /// The user's date of birth.
  final DateTime dateOfBirth;

  /// The user's unique identifier.
  final String id;

  /// The user's slug.
  final String slug;

  /// The user's email address.
  final String email;

  /// The user's phone number.
  final int phone;

  /// Whether the user's phone number is verified.
  final bool phoneVerification;

  /// The user's addresses.
  final List<dynamic> addresses;

  /// The user's orders.
  final List<dynamic> orders;

  /// The user's role.
  final String role;

  /// Whether the user is an admin.
  final bool isAdmin;

  /// The user's favorite restaurants.
  final List<FavoriteRestaurants> favoriteRestaurants;

  /// The user's favorite meals.
  final List<FavoriteMeals> favoriteMeals;

  /// The date and time when the user was created.
  final DateTime createdAt;

  /// The date and time when the user was last updated.
  final DateTime updatedAt;

  /// The user's access token.
  final String accessToken;

  /// The user's refresh token.
  final String refreshToken;

  /// The user's gender.
  final String gender;

  /// The date and time when the user logged out.
  final DateTime? logout;

  /// Constructs a [User] with the given properties.
  User({
    required this.name,
    required this.avatar,
    required this.dateOfBirth,
    required this.id,
    required this.slug,
    required this.email,
    required this.phone,
    required this.phoneVerification,
    required this.addresses,
    required this.orders,
    required this.role,
    required this.isAdmin,
    required this.favoriteRestaurants,
    required this.favoriteMeals,
    required this.createdAt,
    required this.updatedAt,
    required this.accessToken,
    required this.refreshToken,
    required this.gender,
    this.logout,
  });

  /// Creates a [User] from a JSON map.
  ///
  /// @param json The JSON map to parse.
  /// @returns A [User] object.
  factory User.fromJson(Map<String, dynamic> json) => User(
        name: Name.fromJson(json["name"]),
        avatar: Avatar.fromJson(json["avatar"]),
        dateOfBirth: DateTime.parse(
          json["dateOfBirth"] ?? DateTime.now().toString(),
        ),
        id: json["_id"],
        slug: json["slug"],
        email: json["email"],
        phone: json["phone"],
        phoneVerification: json["phoneVerification"],
        addresses: List<dynamic>.from(json["addresses"].map((x) => x)),
        orders: List<dynamic>.from(json["orders"].map((x) => x)),
        role: json["role"],
        isAdmin: json["isAdmin"],
        favoriteRestaurants: List<FavoriteRestaurants>.from(
          json["favoriteRestaurants"].map((x) {
            return FavoriteRestaurants.fromJson(x);
          }),
        ),
        favoriteMeals: List<FavoriteMeals>.from(json["favoriteMeals"].map((x) {
          return FavoriteMeals.fromJson(x);
        })),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        gender: json["gender"],
        logout: DateTime.parse(json["logout"] ?? DateTime.now().toString()),
      );
}

/// Represents a user's avatar.
///
/// Example usage:
/// ```dart
/// final avatar = Avatar.fromJson(jsonMap);
/// print(avatar.url);
/// ```
class Avatar {
  /// The URL of the avatar image.
  final String url;

  /// The public ID of the avatar image.
  final String publicId;

  /// Constructs an [Avatar] with the given [url] and [publicId].
  Avatar({
    required this.url,
    required this.publicId,
  });

  /// Creates an [Avatar] from a JSON map.
  ///
  /// @param json The JSON map to parse.
  /// @returns An [Avatar] object.
  factory Avatar.fromJson(Map<String, dynamic> json) {
    return Avatar(url: json["url"], publicId: json["publicId"]);
  }

  /// Converts the [Avatar] to a JSON map.
  ///
  /// @returns A JSON map representing the [Avatar].
  Map<String, dynamic> toJson() {
    return {"url": url, "publicId": publicId};
  }
}

/// Represents a user's favorite restaurant.
///
/// Example usage:
/// ```dart
/// final favoriteRestaurant = FavoriteRestaurants.fromJson(jsonMap);
/// print(favoriteRestaurant.restaurant);
/// ```
class FavoriteRestaurants {
  /// Whether the restaurant is added to favorites.
  final bool isAdded;

  /// The unique identifier of the favorite restaurant.
  final String id;

  /// The name of the favorite restaurant.
  final String restaurant;

  /// Constructs a [FavoriteRestaurants] with the given properties.
  FavoriteRestaurants({
    required this.isAdded,
    required this.id,
    required this.restaurant,
  });

  /// Creates a [FavoriteRestaurants] from a JSON map.
  ///
  /// @param json The JSON map to parse.
  /// @returns A [FavoriteRestaurants] object.
  factory FavoriteRestaurants.fromJson(Map<String, dynamic> json) {
    return FavoriteRestaurants(
      isAdded: json["isAdded"],
      id: json["_id"],
      restaurant: json["restaurant"],
    );
  }

  /// Converts the [FavoriteRestaurants] to a JSON map.
  ///
  /// @returns A JSON map representing the [FavoriteRestaurants].
  Map<String, dynamic> toJson() {
    return {"isAdded": isAdded, "_id": id, "restaurant": restaurant};
  }
}

/// Represents a user's favorite meal.
///
/// Example usage:
/// ```dart
/// final favoriteMeal = FavoriteMeals.fromJson(jsonMap);
/// print(favoriteMeal.meals);
/// ```
class FavoriteMeals {
  /// Whether the meal is added to favorites.
  final bool isAdded;

  /// The unique identifier of the favorite meal.
  final String id;

  /// The name of the favorite meal.
  final String meals;

  /// Constructs a [FavoriteMeals] with the given properties.
  FavoriteMeals({
    required this.isAdded,
    required this.id,
    required this.meals,
  });

  /// Creates a [FavoriteMeals] from a JSON map.
  ///
  /// @param json The JSON map to parse.
  /// @returns A [FavoriteMeals] object.
  factory FavoriteMeals.fromJson(Map<String, dynamic> json) {
    return FavoriteMeals(
      isAdded: json["isAdded"],
      id: json["_id"],
      meals: json["meals"],
    );
  }

  /// Converts the [FavoriteMeals] to a JSON map.
  ///
  /// @returns A JSON map representing the [FavoriteMeals].
  Map<String, dynamic> toJson() {
    return {"isAdded": isAdded, "_id": id, "meals": meals};
  }
}

/// Represents a user's name in different languages.
///
/// Example usage:
/// ```dart
/// final name = Name.fromJson(jsonMap);
/// print(name.en);
/// ```
class Name {
  /// The user's name in English.
  final String en;

  /// The user's name in Arabic.
  final String ar;

  /// Constructs a [Name] with the given [en] and [ar].
  Name({
    required this.en,
    required this.ar,
  });

  /// Creates a [Name] from a JSON map.
  ///
  /// @param json The JSON map to parse.
  /// @returns A [Name] object.
  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(en: json["en"], ar: json["ar"]);
  }

  /// Converts the [Name] to a JSON map.
  ///
  /// @returns A JSON map representing the [Name].
  Map<String, dynamic> toJson() {
    return {"en": en, "ar": ar};
  }
}

/// Parses a JSON string and returns a [LoginResponse] object.
///
/// @param str The JSON string to parse.
/// @returns A [LoginResponse] object.
LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(jsonDecode(str));
