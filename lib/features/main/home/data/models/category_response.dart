import 'dart:convert';

/// Converts a JSON string into a list of `CategoryResponse` objects.
///
/// @param str The JSON string to be converted.
/// @returns A list of `CategoryResponse` objects.
List<CategoryResponse> categoryResponseFromJson(String str) =>
    List<CategoryResponse>.from(
        json.decode(str).map((x) => CategoryResponse.fromJson(x)));

/// Converts a list of `CategoryResponse` objects into a JSON string.
///
/// @param data The list of `CategoryResponse` objects to be converted.
/// @returns A JSON string representing the list of `CategoryResponse` objects.
String categoryResponseToJson(List<CategoryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// A model class representing a category response.
///
/// This class is used to parse JSON data received from the server.
class CategoryResponse {
  /// The unique identifier of the category.
  final String id;

  /// The title of the category in different languages.
  final CategoryTitle title;

  /// The value of the category.
  final String value;

  /// The slug of the category.
  final String slug;

  /// The icon of the category.
  final String icon;

  /// The version of the category.
  final int v;

  /// Creates a new `CategoryResponse` instance.
  ///
  /// @param id The unique identifier of the category.
  /// @param title The title of the category in different languages.
  /// @param value The value of the category.
  /// @param slug The slug of the category.
  /// @param icon The icon of the category.
  /// @param v The version of the category.
  CategoryResponse({
    required this.id,
    required this.title,
    required this.value,
    required this.slug,
    required this.icon,
    required this.v,
  });

  /// Creates a new `CategoryResponse` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `CategoryResponse` instance.
  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        id: json["_id"],
        title: CategoryTitle.fromJson(json["title"]),
        value: json["value"],
        slug: json["slug"],
        icon: json["icon"],
        v: json["__v"],
      );

  /// Converts the `CategoryResponse` instance into a JSON object.
  ///
  /// @returns A JSON object representing the `CategoryResponse` instance.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title.toJson(),
        "value": value,
        "slug": slug,
        "icon": icon,
        "__v": v,
      };
}

/// A model class representing the title of a category in different languages.
///
/// This class is used to parse JSON data received from the server.
class CategoryTitle {
  /// The English title of the category.
  final String en;

  /// The Arabic title of the category.
  final String ar;

  /// Creates a new `CategoryTitle` instance.
  ///
  /// @param en The English title of the category.
  /// @param ar The Arabic title of the category.
  CategoryTitle({
    required this.en,
    required this.ar,
  });

  /// Creates a new `CategoryTitle` instance from a JSON object.
  ///
  /// @param json The JSON object to be converted.
  /// @returns A new `CategoryTitle` instance.
  factory CategoryTitle.fromJson(Map<String, dynamic> json) => CategoryTitle(
        en: json["en"],
        ar: json["ar"],
      );

  /// Converts the `CategoryTitle` instance into a JSON object.
  ///
  /// @returns A JSON object representing the `CategoryTitle` instance.
  Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
      };
}
